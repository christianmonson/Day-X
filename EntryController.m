//
//  EntryController.m
//  DayX
//
//  Created by Christian Monson on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

static NSString * const entryListKey = @"entryList";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        
    });
    return sharedInstance;
}

- (NSArray *)entries {
    
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:[NSFetchRequest fetchRequestWithEntityName:@"Entry"] error:NULL];

}

- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text andDate:(NSDate *)date {
    
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    entry.title = title;
    entry.text = text;
    entry.timestamp = date;
    
    [self synchronize];
}

- (void)removeEntry:(Entry *)entry{
    
//    [[Stack sharedInstance].managedObjectContext deleteObject:entry];
    [entry.managedObjectContext deleteObject: entry];
    
    [self synchronize];

}


- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

@end
