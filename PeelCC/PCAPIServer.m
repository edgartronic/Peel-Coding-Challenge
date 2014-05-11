//
//  PCAPIServer.m
//  PeelCC
//
//  Created by Edgar Nunez on 5/10/14.
//  Copyright (c) 2014 Edgar Nunez. All rights reserved.
//

#import "PCAPIServer.h"
#import "PCProgram.h"
#import "PCSection.h"

@interface PCAPIServer () {

    PCSection *sectionDrama;
    PCSection *sectionComedy;
    PCSection *sectionKids;
    PCSection *sectionNews;
    PCSection *sectionAnimation;
    PCSection *sectionBusiness;
    PCSection *sectionDocumentary;
    PCSection *sectionEntertainment;
    PCSection *sectionGameShow;
    PCSection *sectionLifestyle;
    PCSection *sectionMusicAndDance;
    PCSection *sectionNonFiction;
    PCSection *sectionReality;
    PCSection *sectionTalk;
    PCSection *sectionWar;
    PCSection *sectionOther;
    
    NSMutableArray *resultArray;
    
}

- (void) initializeSections;
- (void) addSectionsToResultArray;
- (void) addProgram: (PCProgram *) programToAdd;

@end

@implementation PCAPIServer

- (NSArray *) parseJSONData {
    
    [self initializeSections];
    
    NSString *path = [[NSBundle mainBundle] pathForResource: @"JSON-Response"
                                                     ofType: @"txt"];

    NSData *data = [[NSData alloc] initWithContentsOfFile: path];
    
    NSDictionary *dict = [[NSJSONSerialization JSONObjectWithData: data
                                                         options: NSJSONReadingAllowFragments
                                                           error: nil] objectForKey: @"schedules"];
    for (NSDictionary *singleDict in dict) {
        
        NSString *category = [[singleDict objectForKey: KEY_PROGRAM] objectForKey: KEY_SECTION_TYPE];
        PCProgram *p;

        NSRange commaRange = [category rangeOfString: @","];
        
        if (commaRange.location != NSNotFound) {
            
            NSArray *multipleCategories = [category componentsSeparatedByString:@","];

            for (NSString *newCat in multipleCategories) {
                
                NSMutableDictionary *newProgramDict = [NSMutableDictionary dictionaryWithDictionary:[singleDict objectForKey: KEY_PROGRAM]];
                [newProgramDict setValue: newCat forKey: KEY_SECTION_TYPE];
                
                NSMutableDictionary *newMainDict = [NSMutableDictionary dictionaryWithDictionary:singleDict];
                
                [newMainDict setValue: newProgramDict forKey: KEY_PROGRAM];
                
                p = [[PCProgram alloc] initWithDictionary: newMainDict];
                [self addProgram: p];
                
            }
            
        } else {
            p = [[PCProgram alloc] initWithDictionary: singleDict];
            [self addProgram: p];
        }
        
    }
    
    [self addSectionsToResultArray];
    
    return resultArray;
    
}

- (void) initializeSections {
    resultArray = [NSMutableArray array];
    
    sectionDrama = [PCSection new];
    sectionDrama.sectionName = @"Drama";
    
    sectionComedy = [PCSection new];
    sectionComedy.sectionName = @"Comedy";
    
    sectionKids = [PCSection new];
    sectionKids.sectionName = @"Kids";
    
    sectionNews = [PCSection new];
    sectionNews.sectionName = @"News";
    
    sectionAnimation = [PCSection new];
    sectionBusiness = [PCSection new];
    sectionDocumentary = [PCSection new];
    sectionEntertainment = [PCSection new];
    sectionGameShow = [PCSection new];
    sectionLifestyle = [PCSection new];
    sectionMusicAndDance = [PCSection new];
    sectionNonFiction = [PCSection new];
    sectionReality = [PCSection new];
    sectionTalk = [PCSection new];
    sectionWar = [PCSection new];
    
    sectionOther = [PCSection new];
    sectionOther.sectionName = @"Other";
}

- (void) addProgram: (PCProgram *) programToAdd {
    
    if (programToAdd.sectionType == (PCProgramSectionType *) PCProgramSectionTypeDrama) {
        [sectionDrama.shows addObject: programToAdd];
    }
    if (programToAdd.sectionType == (PCProgramSectionType *) PCProgramSectionTypeComedy) {
        [sectionComedy.shows addObject: programToAdd];
    }
    if (programToAdd.sectionType == (PCProgramSectionType *) PCProgramSectionTypeNews) {
        [sectionNews.shows addObject: programToAdd];
    }
    if (programToAdd.sectionType == (PCProgramSectionType *) PCProgramSectionTypeKids) {
        [sectionKids.shows addObject: programToAdd];
    }
    
    if (programToAdd.sectionType == (PCProgramSectionType *) PCProgramSectionTypeOther) {
        [sectionOther.shows addObject: programToAdd];
    }
}

- (void) addSectionsToResultArray {
    
    if (sectionDrama.shows.count > 0) {
        [resultArray addObject: sectionDrama];
    }
    if (sectionComedy.shows.count > 0) {
        [resultArray addObject: sectionComedy];
    }
    if (sectionNews.shows.count > 0) {
        [resultArray addObject: sectionNews];
    }
    if (sectionKids.shows.count > 0) {
        [resultArray addObject: sectionKids];
    }
    if (sectionOther.shows.count > 0) {
        [resultArray addObject: sectionOther];
    }
}

@end
