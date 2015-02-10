//
//  Entry.m
//  DayX
//
//  Created by Christian Monson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

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


@end
