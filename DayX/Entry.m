//
//  Entry.m
//  DayX
//
//  Created by Christian Monson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString * const entriesKey = @"entries";

@implementation Entry

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[titleNewKey];
        self.text = dictionary[textNewKey];
        self.timestamp = dictionary[timestampKey];
    }
    return self;
}

- (NSDictionary *)entryDictionary {
    
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title) {
        [entryDictionary setObject:self.title forKey:titleNewKey];
    }
    if (self.text) {
        [entryDictionary setObject:self.text forKey:textNewKey];
    }
    if (self.timestamp) {
        [entryDictionary setObject:self.timestamp forKey:timestampKey];
    }
    
    return entryDictionary;
    
}

@end
