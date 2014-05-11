//
//  PCViewController.m
//  PeelCC
//
//  Created by Edgar Nunez on 5/10/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import "PCViewController.h"
#import "PCThumbnailView.h"
#import "PCAPIServer.h"
#import "PCSection.h"
#import "PCProgram.h"

@interface PCViewController () {
    NSArray *arr;
    NSMutableArray *scrollViewsArray;
}

- (UIScrollView *) createScrollViewForSection: (PCSection *) section withFrame: (CGRect) frame;

@end

@implementation PCViewController


#pragma mark -
#pragma mark View controller methods

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self == [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil]) {
        scrollViewsArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.mainScroll.backgroundColor = [UIColor blueColor];
    self.mainScroll.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    PCAPIServer *api = [PCAPIServer new];
    arr = [api parseJSONData];
    NSInteger yOrigin = self.view.frame.origin.y + 5;

    for (PCSection *section in arr) {
        
        UILabel *sectionLabel = [[UILabel alloc] initWithFrame: CGRectMake(self.view.frame.origin.x + 10, yOrigin, self.view.frame.size.width - 20, 30)];
        sectionLabel.tag = 1234;
        sectionLabel.text = section.sectionName;
        sectionLabel.backgroundColor = [UIColor redColor];
        sectionLabel.textColor = YELLOW_COLOR;
        sectionLabel.font = [UIFont italicSystemFontOfSize: 16];
        
        [self.mainScroll addSubview: sectionLabel];
        
        yOrigin = yOrigin + sectionLabel.frame.size.height + 5;
        
        CGRect scrollRect = CGRectMake(sectionLabel.frame.origin.x, yOrigin, self.view.frame.size.width - 20, 190);
        
        UIScrollView *sectionScroll = [self createScrollViewForSection: section withFrame: scrollRect];
        [self.mainScroll addSubview: sectionScroll];
        yOrigin = yOrigin + sectionScroll.frame.size.height + 10;

        
    }
    self.mainScroll.contentSize = CGSizeMake(self.view.frame.size.width, yOrigin);
    
}

- (void) viewWillAppear:(BOOL)animated {
    
    self.title = @"TV SHOWS";
    self.view.backgroundColor = GRAY_COLOR;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIScrollView *) createScrollViewForSection: (PCSection *) section withFrame:(CGRect)frame {
    

    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame: frame];
    scroll.delegate = self;
    scroll.tag = 5678;
    scroll.backgroundColor = [UIColor greenColor];
    
    NSInteger xOrigin = 5;
    
    for (PCProgram *program in section.shows) {
        
        PCThumbnailView *thumbnail = [[PCThumbnailView alloc] initWithURLString: program.thumbnailURL];
        thumbnail.frame = CGRectMake(xOrigin, 5, thumbnail.frame.size.width, thumbnail.frame.size.height);
        
        [scroll addSubview: thumbnail];

        UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(xOrigin, thumbnail.frame.origin.y + thumbnail.frame.size.height + 10, thumbnail.frame.size.width, 20)];
        label.backgroundColor = [UIColor darkGrayColor];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 2;
        label.font = [UIFont systemFontOfSize: 12];
        label.text = program.programTitle;

        
        [scroll addSubview: label];
        
        xOrigin = xOrigin + thumbnail.frame.size.width + 10;

        
    }
    
    scroll.contentSize = CGSizeMake(xOrigin, scroll.frame.size.height);

    return scroll;
    
}

@end
