//
//  AppDelegate.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/10/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "AppDelegate.h"

#import "MyPetViewController.h"
#import "TrainingViewController.h"
#import "BattleViewController.h"
#import "TheMasterViewController.h"
#import "NavigatorViewController.h"

#import "MyPetNavigationController.h"
#import "TrainingNavigationController.h"
#import "BattleNavigationController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UIViewController *myPetViewController = [[MyPetViewController alloc] initWithNibName:@"MyPetViewController" bundle:nil];
    UIViewController *trainingViewController = [[TrainingViewController alloc] initWithNibName:@"TrainingViewController" bundle:nil];
    UIViewController *battleViewController = [[BattleViewController alloc] initWithNibName:@"BattleViewController" bundle:nil];
    UIViewController *theMasterViewController = [[TheMasterViewController alloc] initWithNibName:@"TheMasterViewController" bundle:nil];
    UIViewController *navigatorViewController = [[NavigatorViewController alloc] initWithNibName:@"NavigatorViewController" bundle:nil];
    
    UINavigationController *myPetNavigationController = [[MyPetNavigationController alloc] initWithRootViewController:myPetViewController];
    UINavigationController *trainingNavigationController = [[TrainingNavigationController alloc] initWithRootViewController:trainingViewController];
    UINavigationController *battleNavigationController = [[BattleNavigationController alloc] initWithRootViewController:battleViewController];
    UINavigationController *theMasterNavigationController = [[UINavigationController alloc] initWithRootViewController:theMasterViewController];
    UINavigationController *navigatorNavigationController = [[UINavigationController alloc] initWithRootViewController:navigatorViewController];
    
    theMasterNavigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navigatorNavigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;    
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    self.tabBarController.viewControllers = @[myPetNavigationController, trainingNavigationController, battleNavigationController, theMasterNavigationController, navigatorNavigationController];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
