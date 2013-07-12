//
//  AppDelegate.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/10/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "AppDelegate.h"

#import "GAI.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"keychainID" accessGroup:nil];
    [keychain setObject:@"Pets Alliance" forKey: (__bridge id)kSecAttrService];

    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [GAI sharedInstance].dispatchInterval = 20;
    [GAI sharedInstance].debug = YES;
    id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-42270065-1"];
    [tracker setAppName:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]];
    
    // NUI for buttons and labels
    [NUISettings initWithStylesheet:@"custom"];
    [NUIAppearance init];
    
    PetStatusView *petStatus = [[PetStatusView alloc] initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width, 100)];
    
    MyPetViewController *myPetViewController = [[MyPetViewController alloc] initWithPetStatusView:petStatus];
    ItemsViewController *itemsViewController = [[ItemsViewController alloc] initWithPetStatusView:petStatus];
    TrainingViewController *trainingViewController = [[TrainingViewController alloc] initWithPetStatusView:petStatus];
    BattleViewController *battleViewController = [[BattleViewController alloc] initWithPetStatusView:petStatus];
    ViewMoreViewController *viewMoreViewController = [[ViewMoreViewController alloc] init];
    
    UINavigationController *myPetNavigationController = [[MyPetNavigationController alloc] initWithRootViewController:myPetViewController];
    UINavigationController *itemsNavigationController = [[ItemsNavigationController alloc] initWithRootViewController:itemsViewController];
    UINavigationController *trainingNavigationController = [[TrainingNavigationController alloc] initWithRootViewController:trainingViewController];
    UINavigationController *battleNavigationController = [[BattleNavigationController alloc] initWithRootViewController:battleViewController];
    UINavigationController *viewMoreNavigationController = [[ViewMoreNavigationController alloc] initWithRootViewController:viewMoreViewController];

    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[myPetNavigationController, itemsNavigationController, trainingNavigationController, battleNavigationController, viewMoreNavigationController];

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];

    // Login logic.
    LoginViewController *loginController = [[LoginViewController alloc] init:myPetViewController];
    LoginNavigationController *loginNavigationController = [[LoginNavigationController alloc] initWithRootViewController:loginController];

    NSUUID *vendorIdObject = [[UIDevice currentDevice] identifierForVendor];
    NSString *uuid = [vendorIdObject UUIDString];
    NSString *email = [keychain objectForKey:(__bridge id)kSecAttrAccount];
    NSString *password = [keychain objectForKey:(__bridge id)kSecValueData];
    NSDictionary *auth = @{ @"app_id":uuid, @"email":email, @"password":password};
    
    RKLogConfigureByName("RestKit/Network*", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    
    //let AFNetworking manage the activity indicator
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    // Initialize HTTPClient
    NSURL *localURL = [NSURL URLWithString:LOCALURL];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:localURL];
    
    //we want to work with JSON-Data
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    
    // Initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    [RKObjectManager setSharedManager:objectManager];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window.rootViewController.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading";
    
    NSMutableURLRequest *request = [objectManager requestWithObject:nil method:RKRequestMethodPOST path:@"iphone" parameters:auth];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ User.userResponseDescriptor, Pet.responseDescriptor, Error.responseDescriptor, Success.responseDescriptor ]];

    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"successfully logged in!");
        NSArray *pets = [mappingResult.dictionary objectForKey:@"pets"];
        User *user = [mappingResult.dictionary objectForKey:@"user"];
        [petStatus setUser:user];
        [myPetViewController loadUser:user andPets:pets];
        [hud hide:YES];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [hud hide:YES];
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self.window.rootViewController presentViewController:loginNavigationController animated:YES completion:nil];
        });
    }];
    
    [objectManager enqueueObjectRequestOperation:objectRequestOperation];

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
