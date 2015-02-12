//
//  Entry.h
//  DayX
//
//  Created by Christian Monson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const titleNewKey = @"title";
static NSString * const textNewKey = @"text";
static NSString * const timestampKey = @"timestamp";

@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timestamp;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)entryDictionary;

@end