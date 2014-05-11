//
//  PCSection.m
//  PeelCC
//
//  Created by Edgar Nunez on 5/10/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import "PCSection.h"

@implementation PCSection

@synthesize shows, sectionName;

- (id) init {
    if (self == [super init]) {
        shows = [NSMutableArray array];
    }
    return self;
}

@end
