//
//  MyPetViewController.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/10/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "HelpNavigationController.h"
#import "HelpViewController.h"
#import "SwitchPetsNavigationController.h"
#import "SwitchPetsViewController.h"
#import "ItemsNavigationController.h"
#import "ItemsViewController.h"

#import "PetStatusView.h"

#import "User.h"


@interface MyPetViewController : UIViewController {
    UIScrollView *uiScrollView;
    PetStatusView *petStatusView;
    UIImageView *character;
}

@property (nonatomic, retain) UIScrollView *uiScrollView;
@property (nonatomic, retain) PetStatusView *petStatusView;
@property (nonatomic, retain) UIImageView *character;

- (void)loadUser:(User *)user andPets:(NSArray *)pets;
- (id)initWithPetStatusView:(PetStatusView *)petStatus;

@end
