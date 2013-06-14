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
        self.backgroundColor = [UIColor blackColor];

        // LABELS FOR STATUS VIEW
        UIFont *statusFont = [UIFont systemFontOfSize:12];
        
        // Labels for the left side of status view
        StatusLabel *hpLabel = [[StatusLabel alloc] initWithTitle:@"HP" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                        AndXPos:10 AndYPos:20 AndWidth:50 AndHeight:15];
        [self addSubview: hpLabel];
        
        StatusLabel *energyLabel = [[StatusLabel alloc] initWithTitle:@"Energy" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                                AndXPos:10 AndYPos:35 AndWidth:50 AndHeight:15];
        [self addSubview: energyLabel];
        
        StatusLabel *moneyLabel = [[StatusLabel alloc] initWithTitle:@"Money" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                              AndXPos:10 AndYPos:50 AndWidth:50 AndHeight:15];
        [self addSubview: moneyLabel];
        
        StatusLabel *bankLabel = [[StatusLabel alloc] initWithTitle:@"Bank" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                            AndXPos:10 AndYPos:65 AndWidth:50 AndHeight:15];
        [self addSubview: bankLabel];
        
        // Labels for the right side of status view        
        StatusLabel *levelLabel = [[StatusLabel alloc] initWithTitle:@"Level" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                              AndXPos:130 AndYPos:5 AndWidth:50 AndHeight:15];
        [self addSubview: levelLabel];
        
        StatusLabel *expLabel = [[StatusLabel alloc] initWithTitle:@"Experience" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                                 AndXPos:130 AndYPos:20 AndWidth:80 AndHeight:15];
        [self addSubview: expLabel];
        
        StatusLabel *groupLabel = [[StatusLabel alloc] initWithTitle:@"Members" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                                AndXPos:130 AndYPos:35 AndWidth:80 AndHeight:15];
        [self addSubview: groupLabel];
        
        StatusLabel *attackLabel = [[StatusLabel alloc] initWithTitle:@"Attack" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                                AndXPos:130 AndYPos:50 AndWidth:50 AndHeight:15];
        [self addSubview: attackLabel];

        StatusLabel *defenseLabel = [[StatusLabel alloc] initWithTitle:@"Defense" AndFont:statusFont AndTextColor:[UIColor whiteColor] AndBackgroundColor:[UIColor clearColor]
                                                                                  AndXPos:130 AndYPos:65 AndWidth:50 AndHeight:15];
        [self addSubview: defenseLabel];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
