//
//  AttackSelectionView.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BattleOptionsview.h"
#import "InBattleViewController.h"

#import "AttackAnimationManager.h"

@class InBattleViewController;
@interface AttackSelectionView : UIView {
    InBattleViewController *inBattleController;
}

@property (nonatomic, assign) InBattleViewController *inBattleController;

@end
