//
//  PCProgram.h
//  peelui
//
//  Created by Edgar Nunez on 5/5/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PCProgramTypeTVShow = 0,
    PCProgramTypeMovie = 1,
    PCProgramTypeSports = 2
} PCProgramType;

typedef enum {
    PCProgramSectionTypeComedy = 0,
    PCProgramSectionTypeDrama = 1,
    PCProgramSectionTypeKids = 2,
    PCProgramSectionTypeNews = 3,
    PCProgramSectionTypeAnimation = 4,
    PCProgramSectionTypeBusiness = 5,
    PCProgramSectionTypeDocumentary = 6,
    PCProgramSectionTypeEntertainment = 7,
    PCProgramSectionTypeGameShow = 8,
    PCProgramSectionTypeLifestyle = 9,
    PCProgramSectionTypeMusicAndDance = 10,
    PCProgramSectionTypeNonFiction = 11,
    PCProgramSectionTypeReality = 12,
    PCProgramSectionTypeTalk = 13,
    PCProgramSectionTypeWar = 14,
    PCProgramSectionTypeOther = 15
} PCProgramSectionType;

@interface PCProgram : NSObject

@property (nonatomic) PCProgramType *programType;
@property (nonatomic) PCProgramSectionType *sectionType;
@property (nonatomic, strong) NSString *thumbnailURL;
@property (nonatomic, strong) NSString *programTitle;

- (id) initWithDictionary: (NSDictionary *) _dict;

@end
