//
//  MyPetViewController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/10/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "MyPetViewController.h"

@interface MyPetViewController ()

@end

@implementation MyPetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"My Pet";
        self.view.nuiClass = @"DefaultView";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch Pets" style:UIBarButtonItemStyleBordered target:self action:@selector(switchPets:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Help" style:UIBarButtonItemStyleBordered target:self action:@selector(viewHelp:)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int petStatusViewHeight = 100;
    int navHeight = self.tabBarController.tabBar.frame.size.height + self.navigationController.navigationBar.frame.size.height;
    
    PetStatusView *petStatusView = [[PetStatusView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, petStatusViewHeight)];
    [self.view addSubview:petStatusView];
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100 - navHeight)];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:scrollView];
    
    UIView *mainPetView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    [scrollView addSubview:mainPetView];
        
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Pet" forState:UIControlStateNormal];
    [button setNuiClass:@"Button:LargeButton"];
    [button setFrame:CGRectMake(20, 20, 110, 50)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:button];
    
    UIButton *myItemsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myItemsButton setFrame:CGRectMake(20, 90, 110, 50)];
    [myItemsButton setTitle:@"My Items" forState:UIControlStateNormal];
    [myItemsButton setNuiClass:@"Button:LargeButton"];
    [myItemsButton addTarget:self action:@selector(myItemsAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:myItemsButton];

    UIButton *itemStoreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [itemStoreButton setFrame:CGRectMake(20, 160, 110, 50)];
    [itemStoreButton setTitle:@"Item Store" forState:UIControlStateNormal];
    [itemStoreButton setNuiClass:@"Button:LargeButton"];
    [itemStoreButton addTarget:self action:@selector(itemStoreAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:itemStoreButton];
}

- (void)buttonAction: (id) selector {
    NSLog(@"clicked on Pet button");
}

- (void)myItemsAction: (id) selector {
    NSLog(@"clicked on my items button");
    ItemsViewController *itemsViewController = [[ItemsViewController alloc] init];
    ItemsNavigationController *itemsNavigationController = [[ItemsNavigationController alloc] initWithRootViewController:itemsViewController];
    [self presentViewController:itemsNavigationController animated:YES completion:nil];
}

- (void)itemStoreAction: (id) selector {
    NSLog(@"clicked on item store button");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchPets: (id) selector {
    NSLog(@"Opened the switchPets view");
    SwitchPetsViewController *switchPetsView = [[SwitchPetsViewController alloc] init];
    SwitchPetsNavigationController *switchPetsNavigationController = [[SwitchPetsNavigationController alloc] initWithRootViewController:switchPetsView];
    [self presentViewController:switchPetsNavigationController animated:YES completion:nil];
}

- (void)viewHelp: (id) selector {
    NSLog(@"Opened the Help view");
    HelpViewController *helpView = [[HelpViewController alloc] init];
    HelpNavigationController *helpNavgationController = [[HelpNavigationController alloc] initWithRootViewController:helpView];
    [self presentViewController:helpNavgationController animated:YES completion:nil];
}




@end
