//
//  PetStatusView.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "PetStatusView.h"

@implementation PetStatusView
@synthesize pets;
@synthesize user;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setNuiClass:@"StatusView"];
        
        pets = [[NSMutableDictionary alloc] init];
        
        for(int i = 0; i < 3; i++) {
            UILabel *petLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 + i * 110, 15, 70, 15)];
            [petLevelLabel setNuiClass:@"Label:StatusLevelLabel"];
            [petLevelLabel setText:@""];
            [self addSubview:petLevelLabel];
            
            [pets setObject:petLevelLabel forKey:[NSString stringWithFormat:@"petLabel%d", i]];
            
            UIImageView *petImage = [[UIImageView alloc] initWithFrame:CGRectMake(15 + i * 110, 30, 60, 60)];
            [petImage setImage:[UIImage imageNamed:@""]];
            [self addSubview:petImage];
            
            [pets setObject:petImage forKey:[NSString stringWithFormat:@"petImage%d", i]];
        }
    }
    return self;
}

-(void)loadPets:(NSArray *)petsToLoad {
    for(int i = 0; i < [petsToLoad count]; i++) {
        Pet *pet = [petsToLoad objectAtIndex:i];
        
        UILabel *petLevelLabel = [pets objectForKey:[NSString stringWithFormat:@"petLabel%d", i]];
        UIImageView *petImage = [pets objectForKey:[NSString stringWithFormat:@"petImage%d", i]];

        [petLevelLabel setText:[NSString stringWithFormat:@"Lvl. %@", pet.level]];
        [petImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", pet.name]]];
    }
}

@end
