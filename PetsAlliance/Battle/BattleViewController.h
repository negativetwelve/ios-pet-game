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

#import "PetSelectButton.h"
#import "BattleCell.h"

@interface BattleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    PetStatusView *petStatusView;
    UITableView *battleTableView;
    int numberOfCells;
    NSMutableArray *rowHeights;
}

@property (nonatomic, retain) PetStatusView *petStatusView;
@property (nonatomic, strong) NSMutableArray *rowHeights;
@property (nonatomic, retain) UITableView *battleTableView;

- (id)initWithPetStatusView:(PetStatusView *)petStatus;

@end
