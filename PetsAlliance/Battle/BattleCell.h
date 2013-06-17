//
//  BattleCell.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BattleCell : UITableViewCell {
    int petIndex;
    NSArray *petImages;
}

@property (nonatomic, assign) int petIndex;
@property (nonatomic, strong) NSArray *petImages;

@end
