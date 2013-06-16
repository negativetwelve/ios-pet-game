//
//  BattleOptionsView.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "InBattleViewController.h"
#import "ItemsNavigationController.h"
#import "ItemsViewController.h"


@interface BattleOptionsView : UIView {
    UIViewController *inBattleController;
}

@property (nonatomic, assign) UIViewController *inBattleController;

@end
