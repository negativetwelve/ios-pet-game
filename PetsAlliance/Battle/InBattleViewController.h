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
    
    UIView *topHPBar;
    UIView *bottomHPBar;
}

@property (nonatomic, retain) BattleAnimationView *animationView;
@property (nonatomic, retain) UIImageView *topPet;
@property (nonatomic, retain) UIImageView *bottomPet;
@property (nonatomic, retain) Opponent *opponent;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) Battle *battle;

@property (nonatomic, retain) UIView *topHPBar;
@property (nonatomic, retain) UIView *bottomHPBar;

- (void)changeHPBy:(int)amount forPet:(NSString *)pet;

@end
