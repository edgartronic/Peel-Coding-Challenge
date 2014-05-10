//
//  PCThumbnailViewController.m
//  PeelCC
//
//  Created by Edgar Nunez on 5/10/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import "PCThumbnailViewController.h"

#define SHOW_TILE_BG @"Show_Tile_Background.png"

@interface PCThumbnailViewController ()

@end

@implementation PCThumbnailViewController

- (id) init {
    if (self == [super init]) {
        self.view.frame = CGRectMake(0, 0, 115, 160);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *bg = [UIImage imageNamed: SHOW_TILE_BG];
    UIImageView *bgView = [[UIImageView alloc] initWithImage: bg];
    [self.view addSubview: bgView];
    
}

- (void) viewDidAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
