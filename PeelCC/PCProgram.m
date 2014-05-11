//
//  PCProgram.m
//  peelui
//
//  Created by Edgar Nunez on 5/5/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import "PCProgram.h"
#define KEY_PROGRAM @"program"
#define KEY_PROGRAM_TITLE @"11"
#define KEY_THUMBNAIL_URL @"14"
#define KEY_THUMBNAIL_ALT_URL @"21"
#define KEY_SECTION_TYPE @"13"

#define VALUE_PROGRAM_TYPE_DRAMA @"Drama"
#define VALUE_PROGRAM_TYPE_COMEDY @"Comedy"
#define VALUE_PROGRAM_TYPE_KIDS @"Kids"
#define VALUE_PROGRAM_TYPE_NEWS @"News"
#define VALUE_PROGRAM_TYPE_ANIMATION @"Animation"
#define VALUE_PROGRAM_TYPE_BUSINESS @"Business"
#define VALUE_PROGRAM_TYPE_DOCUMENTARY @"Documentary"
#define VALUE_PROGRAM_TYPE_ENTERTAINMENT @"Entertainment"
#define VALUE_PROGRAM_TYPE_GAMESHOW @"Game show"
#define VALUE_PROGRAM_TYPE_LIFESTYLE @"Lifestyle"
#define VALUE_PROGRAM_TYPE_MUSIC @"Music and dance"
#define VALUE_PROGRAM_TYPE_NONFICTION @"NonFiction"
#define VALUE_PROGRAM_TYPE_REALITY @"Reality"
#define VALUE_PROGRAM_TYPE_TALK @"Talk"
#define VALUE_PROGRAM_TYPE_WAR @"War"

@implementation PCProgram

@synthesize programType;
@synthesize sectionType;
@synthesize thumbnailURL;
@synthesize programTitle;

- (id) initWithDictionary: (NSDictionary *) _dict {
    
    if (self == [super init]) {
        
        self.programTitle = [[_dict objectForKey: KEY_PROGRAM] objectForKey: KEY_PROGRAM_TITLE];
        
        NSString *thumbURL = [[_dict objectForKey: KEY_PROGRAM] objectForKey: KEY_THUMBNAIL_URL];
        if (!thumbURL) {
            thumbURL = [_dict objectForKey: KEY_THUMBNAIL_ALT_URL];
        }
        
        self.thumbnailURL = thumbURL;
        
        NSString *typeString = [[_dict objectForKey: KEY_PROGRAM] objectForKey: KEY_SECTION_TYPE];
        
        if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_DRAMA]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeDrama;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_COMEDY]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeComedy;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_KIDS]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeKids;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_NEWS]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeNews;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_ANIMATION]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeAnimation;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_BUSINESS]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeBusiness;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_DOCUMENTARY]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeDocumentary;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_ENTERTAINMENT]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeEntertainment;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_GAMESHOW]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeGameShow;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_LIFESTYLE]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeLifestyle;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_MUSIC]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeMusicAndDance;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_NONFICTION]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeNonFiction;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_REALITY]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeReality;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_TALK]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeTalk;
            
        } else if ([typeString isEqualToString: VALUE_PROGRAM_TYPE_WAR]) {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeWar;
            
        } else {
            self.sectionType = (PCProgramSectionType *) PCProgramSectionTypeOther;
        }
    }
    
    return self;
    
}

@end
