//
//  LeaderboardViewController.h
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "MMViewController.h"

#import "LeaderboardTableView.h"
#import "LeaderboardCell.h"

#import "User.h"
#import "Error.h"
#import "Success.h"

@interface LeaderboardViewController : MMViewController <UITableViewDelegate, UITableViewDataSource> {
    int numberOfCells;
    NSMutableArray *rowHeights;
    NSMutableArray *users;
    UITableView *leaderboardTableView;
    UIRefreshControl *refreshControl;
}

@property (nonatomic, strong) NSMutableArray *rowHeights;
@property (nonatomic, strong) NSMutableArray *users;
@property (nonatomic, retain) UITableView *leaderboardTableView;
@property (nonatomic, retain) UIRefreshControl *refreshControl;

@end
