//
//  DetailContainerViewController.m
//  DayX
//
//  Created by Christian Monson on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailContainerViewController.h"
#import "DetailPageViewControllerDataSource.h"
#import <UIKit/UIKit.h>

@interface DetailContainerViewController ()

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) DetailPageViewControllerDataSource *dataSource;

@end

@implementation DetailContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.dataSource = [DetailPageViewControllerDataSource new];
    self.pageViewController.dataSource = self.dataSource;
    
    
    [self.pageViewController setViewControllers:@[[self.dataSource viewControllerAtIndex:0]]direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
