//
//  InterfaceController.m
//  DayX WatchKit Extension
//
//  Created by Christian Monson on 3/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXEntryListInterfaceController.h"
#import <DayXKit/DayXKit.h>
#import "DXEntryRowController.h"

@interface DXEntryListInterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *entriesTable;

@end


@implementation DXEntryListInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    if ([EntryController sharedInstance].entries.count > 0) {
        [self.entriesTable setNumberOfRows:[EntryController sharedInstance].entries.count withRowType:@"entryRow"];
        
        for (NSInteger index = 0; index < [EntryController sharedInstance].entries.count; index++) {
            Entry *entry = [EntryController sharedInstance].entries[index];
            DXEntryRowController *rowController = [self.entriesTable rowControllerAtIndex:index];
            [rowController updateEntryTitleWithString:entry.title];
        }
    }
}

-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    if ([segueIdentifier isEqualToString:@"rowSelected"]) {
        return [EntryController sharedInstance].entries[rowIndex];
    }
    return nil;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end


