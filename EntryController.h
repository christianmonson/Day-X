//
//  EntryController.h
//  DayX
//
//  Created by Christian Monson on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)removeEntry:(Entry *)entry;
- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text andDate:(NSDate *)date;
- (void)synchronize;

@end