//
//  PCThumbnailView.m
//  peelui
//
//  Created by Edgar Nunez on 5/5/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import "PCThumbnailView.h"

#define THUMBNAIL_BG_IMAGE @"Show_Tile_Background.png"

@implementation PCThumbnailView

- (id)initWithURLString: (NSString *) _urlString
{
    if (self == [super initWithFrame: CGRectZero]) {
        // Initialization code
        self.frame = CGRectMake(0, 0, 110, 151);
        self.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *bgImage = [UIImage imageNamed: THUMBNAIL_BG_IMAGE];
        UIImageView *bgView = [[UIImageView alloc] initWithImage: bgImage];
        bgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview: bgView];
        self.imageURLString = _urlString;

    }
    return self;
}

- (void) willMoveToSuperview:(UIView *)newSuperview {
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(0, 0, 50, 50)];
    spinner.center = self.center;
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    [self addSubview: spinner];
    [spinner startAnimating];
    
    dispatch_queue_t imageLoader = dispatch_queue_create("Image Loader", NULL);
    
    dispatch_async(imageLoader, ^ {
        
        NSData *imageData;
        UIImage *img;
        
        if (!self.imageURLString) {
            img = [UIImage imageNamed: @"DefaultThumbnail.png"];
            
        } else {
            NSURL *url = [NSURL URLWithString: self.imageURLString];
            imageData = [NSData dataWithContentsOfURL: url];
            img = [UIImage imageWithData: imageData];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            
            UIImageView *imgView = [[UIImageView alloc] init];
            imgView.frame = CGRectMake(0, 0, 110, 147);
            imgView.alpha = 0.0;
            imgView.image = img;
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            [self addSubview: imgView];
            
            [spinner stopAnimating];
            [spinner removeFromSuperview];
            
            [UIView animateWithDuration: 1.0 animations: ^ {
                imgView.alpha = 1.0;
            }];
            
            
        });
        
    });
    
}

@end
