//
//  RunSelectionView.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BattleOptionsView.h"

@class InBattleViewController;
@interface RunSelectionView : UIView {
    InBattleViewController *inBattleController;
}

@property (nonatomic, assign) InBattleViewController *inBattleController;

@end
