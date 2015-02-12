//
//  DetailPageViewControllerDataSource.m
//  DayX
//
//  Created by Christian Monson on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailPageViewControllerDataSource.h"
#import "DetailViewController.h"
#import "EntryController.h"

@implementation DetailPageViewControllerDataSource

-(UIViewController *)viewControllerAtIndex:(NSInteger)index{
    if (index < 0 || index >= [EntryController sharedInstance].entries.count) {
        return nil;
    }
    DetailViewController * detailViewController = [DetailViewController new];
    detailViewController.index = index;
    [detailViewController updateWithEntry: [EntryController sharedInstance].entries[index]];
    
    return detailViewController;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger beforeIndex = ((DetailViewController *) viewController).index -1;
    return [self viewControllerAtIndex:beforeIndex];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger beforeIndex = ((DetailViewController *) viewController).index +1;
    return [self viewControllerAtIndex:beforeIndex];
}
@end
