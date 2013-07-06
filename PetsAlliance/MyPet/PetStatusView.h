//
//  PetStatusView.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIButton+NUI.h"
#import "UILabel+NUI.h"
#import "UITextField+NUI.h"

#import "Pet.h"

@interface PetStatusView : UIView {
    NSMutableDictionary *pets;
}

@property (nonatomic, retain) NSMutableDictionary *pets;

-(void)loadPets:(NSArray *)pets;

@end
