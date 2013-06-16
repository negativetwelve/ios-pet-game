//
//  PetStatusView.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "PetStatusView.h"

@implementation PetStatusView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setNuiClass:@"StatusView"];
        
        UILabel *firstPetLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 70, 15)];
        [firstPetLevelLabel setNuiClass:@"Label:StatusLevelLabel"];
        [firstPetLevelLabel setText:@"Lvl."];
        [self addSubview:firstPetLevelLabel];
        
        UILabel *secondPetLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 15, 70, 15)];
        [secondPetLevelLabel setNuiClass:@"Label:StatusLevelLabel"];
        [secondPetLevelLabel setText:@"Lvl."];
        [self addSubview:secondPetLevelLabel];

        UILabel *thirdPetLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(235, 15, 70, 15)];
        [thirdPetLevelLabel setNuiClass:@"Label:StatusLevelLabel"];
        [thirdPetLevelLabel setText:@"Lvl."];
        [self addSubview:thirdPetLevelLabel];
        
        UIImageView *firstPet = [[UIImageView alloc] initWithFrame:CGRectMake(15, 30, 60, 60)];
        [firstPet setImage:[UIImage imageNamed:@"dragon.png"]];
        [self addSubview:firstPet];
        
        UIImageView *secondPet = [[UIImageView alloc] initWithFrame:CGRectMake(125, 30, 60, 60)];
        [secondPet setImage:[UIImage imageNamed:@"cat.png"]];
        [self addSubview:secondPet];
        
        UIImageView *thirdPet = [[UIImageView alloc] initWithFrame:CGRectMake(235, 30, 60, 60)];
        [thirdPet setImage:[UIImage imageNamed:@"dragon.png"]];
        [self addSubview:thirdPet];
    }
    return self;
}

@end
