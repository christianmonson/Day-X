//
//  Entry.h
//  DayX
//
//  Created by Christian Monson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const titleKey = @"titleKey";
static NSString * const textKey = @"textKey";
static NSString * const timeStampKey = @"timeStampKey";

@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timeStamp;

- (id) initWithDictionary: (NSDictionary *) dictionary;

- (NSDictionary *)entryDictionary;

@end
