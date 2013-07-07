//
//  TrainingViewController.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/12/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMViewController.h"

#import "PetStatusView.h"
#import "TrainingTableView.h"

@interface TrainingViewController : MMViewController {
    PetStatusView *petStatusView;
}

@property (nonatomic, retain) PetStatusView *petStatusView;

- (id)initWithPetStatusView:(PetStatusView *)petStatus;

@end
