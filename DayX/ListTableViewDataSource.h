//
//  ListTableViewDataSource.h
//  DayX
//
//  Created by Christian Monson on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

@end