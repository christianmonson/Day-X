//
//  DetailViewController.h
//  DayX
//
//  Created by Parker Rushton on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Entry;

static NSString * const EntryKey = @"entry";

@interface DetailViewController : UIViewController

- (void) updateWithEntry:(Entry *)entry;

@end
