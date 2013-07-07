//
//  ItemsViewController.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/13/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMViewController.h"

#import "PetStatusView.h"
#import "ItemsNavigationScrollView.h"
#import "ItemsTableView.h"

#import "ItemCell.h"

@interface ItemsViewController : MMViewController <UITableViewDelegate, UITableViewDataSource> {
    PetStatusView *petStatusView;
}

@property (nonatomic, retain) PetStatusView *petStatusView;

- (id)initWithPetStatusView:(PetStatusView *)petStatus;

@end
