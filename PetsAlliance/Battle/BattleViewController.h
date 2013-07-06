//
//  BattleViewController.h
//  
//
//  Created by Mark Miyashita on 6/13/13.
//
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

#import "LeaderboardViewController.h"
#import "LeaderboardNavigationController.h"
#import "PetStatusView.h"
#import "BattleTableView.h"
#import "ItemsNavigationController.h"
#import "ItemsViewController.h"

#import "InBattleViewController.h"

#import "PetSelectButton.h"
#import "BattleCell.h"

#import "Success.h"
#import "Error.h"

@interface BattleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    PetStatusView *petStatusView;
    UITableView *battleTableView;
    int numberOfCells;
    NSMutableArray *rowHeights;
    NSMutableArray *users;
    UIRefreshControl *refreshControl;
}

@property (nonatomic, retain) PetStatusView *petStatusView;
@property (nonatomic, strong) NSMutableArray *rowHeights;
@property (nonatomic, strong) NSMutableArray *users;
@property (nonatomic, retain) UITableView *battleTableView;
@property (nonatomic, retain) UIRefreshControl *refreshControl;

- (id)initWithPetStatusView:(PetStatusView *)petStatus;

@end
