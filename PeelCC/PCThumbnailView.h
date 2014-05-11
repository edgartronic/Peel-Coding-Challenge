//
//  PCThumbnailView.h
//  peelui
//
//  Created by Edgar Nunez on 5/5/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCThumbnailView : UIView

@property (nonatomic, strong) NSString *imageURLString;
@property (nonatomic) BOOL loaded;

- (id)initWithURLString: (NSString *) _urlString;
- (void) loadThumbnail;

@end
