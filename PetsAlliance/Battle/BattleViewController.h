//
//  BattleViewController.h
//  
//
//  Created by Mark Miyashita on 6/13/13.
//
//

#import <UIKit/UIKit.h>

#import "LeaderboardViewController.h"
#import "LeaderboardNavigationController.h"
#import "PetStatusView.h"
#import "BattleTableView.h"
#import "ItemsNavigationController.h"
#import "ItemsViewController.h"

#import "InBattleViewController.h"

@interface BattleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView *battleTableView;
    int numberOfCells;
}

@end
