//
//  PCViewController.m
//  PeelCC
//
//  Created by Edgar Nunez on 5/10/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import "PCViewController.h"
#import "PCThumbnailViewController.h"

@interface PCViewController () {
    NSArray *arr;
}


@end

@implementation PCViewController


#pragma mark -
#pragma mark View controller methods

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self == [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arr = [NSArray arrayWithObjects: @"Comedy", @"Drama", @"Kids", @"News", @"Music & Dance", @"Documentary", @"War", nil];
    
}

- (void) viewWillAppear:(BOOL)animated {
    
    self.title = @"TV SHOWS";
    self.view.backgroundColor = GRAY_COLOR;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    self.programTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.programTableView.backgroundColor = [UIColor clearColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table view callbacks

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SectionCell";
    NSString *sectionName;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.backgroundColor = [UIColor clearColor];

        sectionName = [NSString stringWithFormat: @"%@", [arr objectAtIndex: indexPath.row]];
        cell.textLabel.text = sectionName;

        
    } else {
        

    }
    
    return cell;
}

@end
