//
//  AppDelegate.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/10/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <Security/Security.h>

#import "NUIAppearance.h"
#import "KeychainItemWrapper.h"

#import "MyPetViewController.h"
#import "ItemsViewController.h"
#import "TrainingViewController.h"
#import "BattleViewController.h"
#import "TheMasterViewController.h"
#import "NavigatorViewController.h"
#import "ViewMoreViewController.h"
#import "LoginViewController.h"

#import "MyPetNavigationController.h"
#import "ItemsNavigationController.h"
#import "TrainingNavigationController.h"
#import "BattleNavigationController.h"
#import "ViewMoreNavigationController.h"
#import "LoginNavigationController.h"

#import "User.h"
#import "Pet.h"
#import "Error.h"
#import "Success.h"

#import "AESCrypt.h"
#import "MBProgressHUD.h"

#import "PAURLRequest.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
