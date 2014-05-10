//
//  PCNavController.m
//  PeelCC
//
//  Created by Edgar Nunez on 5/10/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import "PCNavController.h"

@interface PCNavController ()

@end

@implementation PCNavController

- (id) initWithRootViewController:(UIViewController *)rootViewController {
    
    if (self == [super initWithRootViewController: rootViewController]) {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    self.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationBar.barTintColor = GRAY_COLOR;
    
    [[UINavigationBar appearance] setTitleTextAttributes:
                                    [NSDictionary dictionaryWithObjectsAndKeys: YELLOW_COLOR, NSForegroundColorAttributeName, nil]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
