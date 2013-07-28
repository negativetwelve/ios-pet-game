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

#import "OpponentBattleStatusView.h"
#import "UserBattleStatusView.h"

#import "User.h"
#import "Opponent.h"
#import "Battle.h"


@interface InBattleViewController : MMViewController {
    BattleAnimationView *animationView;
    UIImageView *topPet;
    UIImageView *bottomPet;
    Opponent *opponent;
    User *user;
    Battle *battle;
    Pet *userPet;
    Pet *opponentPet;
    
    UIView *topHPBar;
    UIView *bottomHPBar;
    UIProgressView *topCharBar;
    UIProgressView *bottomCharBar;
}

@property (nonatomic, retain) BattleAnimationView *animationView;
@property (nonatomic, retain) UIImageView *topPet;
@property (nonatomic, retain) UIImageView *bottomPet;
@property (nonatomic, retain) Opponent *opponent;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) Battle *battle;
@property (nonatomic, retain) Pet *userPet;
@property (nonatomic, retain) Pet *opponentPet;

@property (nonatomic, retain) UIView *topHPBar;
@property (nonatomic, retain) UIView *bottomHPBar;

@property (nonatomic, retain) UIProgressView *topCharBar;
@property (nonatomic, retain) UIProgressView *bottomCharBar;

- (void)changeHPBy:(NSDictionary *)params;
- (void)processBattleActions:(NSArray *)battleActions;

@end
