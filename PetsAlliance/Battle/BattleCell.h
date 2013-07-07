//
//  BattleCell.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PetSelectButton.h"

@class PetSelectButton;
@interface BattleCell : UITableViewCell {
    int petIndex;
    NSArray *petImages;
    
    UIImageView *character;
    NSMutableArray *petButtons;
    PetSelectButton *firstPetButton;
    PetSelectButton *secondPetButton;
    PetSelectButton *thirdPetButton;
    UILabel *username;
    UILabel *skillLevel;
    UILabel *skillLevelValue;
    UILabel *wins;
    UILabel *winsValue;
    UILabel *losses;
    UILabel *lossesValue;
}

@property (nonatomic, assign) int petIndex;
@property (nonatomic, strong) NSArray *petImages;

@property (nonatomic, retain) UIImageView *character;
@property (nonatomic, retain) NSMutableArray *petButtons;
@property (nonatomic, retain) PetSelectButton *firstPetButton;
@property (nonatomic, retain) PetSelectButton *secondPetButton;
@property (nonatomic, retain) PetSelectButton *thirdPetButton;
@property (nonatomic, retain) UILabel *username;
@property (nonatomic, retain) UILabel *skillLevel;
@property (nonatomic, retain) UILabel *skillLevelValue;
@property (nonatomic, retain) UILabel *wins;
@property (nonatomic, retain) UILabel *winsValue;
@property (nonatomic, retain) UILabel *losses;
@property (nonatomic, retain) UILabel *lossesValue;

@end
