//
//  InBattleViewController.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMViewController.h"

#import "BattleAnimationView.h"
#import "BattleOptionsView.h"
#import "PetSelectionView.h"
#import "AttackSelectionView.h"
#import "RunSelectionView.h"

@interface InBattleViewController : MMViewController {
    BattleAnimationView *animationView;
}

@property (nonatomic, retain) BattleAnimationView *animationView;


@end
