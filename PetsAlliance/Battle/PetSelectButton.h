//
//  PetSelectButton.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "BattleCell.h"

@interface PetSelectButton : UIButton {
    BattleCell *cell;
    int index;
}

@property (nonatomic, strong) BattleCell *cell;
@property (nonatomic, assign) int index;

- (id)initWithFrame:(CGRect)frame andNuiClass:(NSString *)nuiClass andImageName:(NSString *)imageName andSelector:(SEL)selector andCell:(BattleCell *)tableViewCell andIndex:(int)index;

@end
