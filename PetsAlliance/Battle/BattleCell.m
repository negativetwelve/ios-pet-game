//
//  BattleCell.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "BattleCell.h"

@implementation BattleCell
@synthesize petIndex = _petIndex;
@synthesize petImages = _petImages;

@synthesize petButtons;

@synthesize character;
@synthesize firstPetButton;
@synthesize secondPetButton;
@synthesize thirdPetButton;
@synthesize username;
@synthesize skillLevel;
@synthesize skillLevelValue;
@synthesize wins;
@synthesize winsValue;
@synthesize losses;
@synthesize lossesValue;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.petButtons = [[NSMutableArray alloc] init];
        
        UIImageView *newCharacter = [[UIImageView alloc] initWithFrame:CGRectMake(5, 35, 40, 80)];
        [newCharacter setImage:[UIImage imageNamed:@""]];
        [self addSubview:newCharacter];
        [self setCharacter:newCharacter];
        
        PetSelectButton *newFirstPetButton = [[PetSelectButton alloc] initWithFrame:CGRectMake(55, 45, 50, 50) andNuiClass:@"ImageButton" andImageName:@"" andSelector:@selector(petSelected:) andCell:self andIndex:1];
        [self addSubview:newFirstPetButton];
        [self setFirstPetButton:newFirstPetButton];
        [self.petButtons addObject:newFirstPetButton];
        
        PetSelectButton *newSecondPetButton = [[PetSelectButton alloc] initWithFrame:CGRectMake(110, 45, 50, 50) andNuiClass:@"ImageButton" andImageName:@"" andSelector:@selector(petSelected:) andCell:self andIndex:2];
        [self addSubview:newSecondPetButton];
        [self setSecondPetButton:newSecondPetButton];
        [self.petButtons addObject:newSecondPetButton];
        
        PetSelectButton *newThirdPetButton = [[PetSelectButton alloc] initWithFrame:CGRectMake(165, 45, 50, 50) andNuiClass:@"ImageButton" andImageName:@"" andSelector:@selector(petSelected:) andCell:self andIndex:3];
        [self addSubview:newThirdPetButton];
        [self setThirdPetButton:newThirdPetButton];
        [self.petButtons addObject:newThirdPetButton];
        
        UILabel *newUsername = [[UILabel alloc] initWithFrame:CGRectMake(5, 2, 120, 15)];
        [newUsername setNuiClass:@"Label:BattleBoldText"];
        [self addSubview:newUsername];
        [self setUsername:newUsername];
        
        UILabel *newSkillLevel = [[UILabel alloc] initWithFrame:CGRectMake(5, 18, 40, 15)];
        [newSkillLevel setText:@"Skill Lvl"];
        [newSkillLevel setNuiClass:@"Label:BattleStat"];
        [self addSubview:newSkillLevel];
        [self setSkillLevel:newSkillLevel];
        
        UILabel *newSkillLevelValue = [[UILabel alloc] initWithFrame:CGRectMake(45, 18, 35, 15)];
        [newSkillLevelValue setNuiClass:@"Label:BattleValue"];
        [self addSubview:newSkillLevelValue];
        [self setSkillLevelValue:newSkillLevelValue];
        
        UILabel *newWins = [[UILabel alloc] initWithFrame:CGRectMake(140, 2, 35, 15)];
        [newWins setText:@"Wins"];
        [newWins setNuiClass:@"Label:BattleStat"];
        [self addSubview:newWins];
        [self setWins:newWins];
        
        UILabel *newWinsValue = [[UILabel alloc] initWithFrame:CGRectMake(180, 2, 45, 15)];
        [newWinsValue setNuiClass:@"Label:BattleValue"];
        [self addSubview:newWinsValue];
        [self setWinsValue:newWinsValue];
        
        UILabel *newLosses = [[UILabel alloc] initWithFrame:CGRectMake(140, 18, 35, 15)];
        [newLosses setText:@"Losses"];
        [newLosses setNuiClass:@"Label:BattleStat"];
        [self addSubview:newLosses];
        [self setLosses:newLosses];
        
        UILabel *newLossesValue = [[UILabel alloc] initWithFrame:CGRectMake(180, 18, 45, 15)];
        [newLossesValue setNuiClass:@"Label:BattleValue"];
        [self addSubview:newLossesValue];
        [self setLossesValue:newLossesValue];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
