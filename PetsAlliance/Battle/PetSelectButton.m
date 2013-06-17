//
//  PetSelectButton.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "PetSelectButton.h"

@implementation PetSelectButton
@synthesize cell = _cell;
@synthesize index = _index;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andNuiClass:(NSString *)nuiClass andImageName:(NSString *)imageName andSelector:(SEL)selector andCell:(BattleCell *)battleCell andIndex:(int)petIndex {
    self = [super initWithFrame:frame];
    if (self) {
        [self setNuiClass:nuiClass];
        [self setIndex:petIndex];
        [self setCell:battleCell];
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self addTarget:cell action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
