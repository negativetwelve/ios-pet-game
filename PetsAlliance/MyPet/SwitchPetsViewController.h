//
//  SwitchPetsViewController.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KeychainItemWrapper.h"

#import "MyPetViewController.h"
#import "LoginNavigationController.h"
#import "LoginViewController.h"

@class MyPetViewController;
@interface SwitchPetsViewController : UITableViewController {
    MyPetViewController *home;
}

@property (nonatomic, retain) MyPetViewController *home;

@end
