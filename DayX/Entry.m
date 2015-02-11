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

- (NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title) {
        [entryDictionary setObject:self.title forKey:titleKey];
    }
    if (self.text) {
        [entryDictionary setObject:self.text forKey:textKey];
    }
    if (self.timeStamp) {
        [entryDictionary setObject:self.timeStamp forKey:timeStampKey];
    }
    return entryDictionary;
}

- (id) initWithDictionary: (NSDictionary *) dictionary {
    self.title = dictionary[titleKey];
    self.text = dictionary[textKey];
    self.timeStamp = dictionary[timeStampKey];
    
    return self;
    
}

+ (NSMutableArray *) loadEntriesFromDefaults {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entriesKey];
    
    NSMutableArray *entries = [NSMutableArray new];
    
    for (NSDictionary *entryDictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
        [entries addObject:entry];
    }
    return entries;
}

+ (void) storeEntiresInDefaults: (NSArray *)entries {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entriesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
