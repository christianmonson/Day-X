//
//  DetailPageViewControllerDataSource.h
//  DayX
//
//  Created by Christian Monson on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DetailPageViewControllerDataSource : NSObject <UIPageViewControllerDataSource>


- (UIViewController *) viewControllerAtIndex:(NSInteger)index;

@end
