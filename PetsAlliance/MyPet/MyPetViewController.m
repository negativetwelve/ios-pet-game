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
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch Pets" style:UIBarButtonItemStyleBordered target:self action:@selector(switchPets:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Help" style:UIBarButtonItemStyleBordered target:self action:@selector(viewHelp:)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PetStatusView *petStatusView = [[PetStatusView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [self.view addSubview:petStatusView];
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:scrollView];
    
    UIView *mainPetView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    mainPetView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:mainPetView];
    
    UIView *petsView = [[UIView alloc] initWithFrame:CGRectMake(20, 230, 280, 80)];
    petsView.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:petsView];
        
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(20, 20, 110, 50)];
    [button setTitle:@"Pet" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:button];
    
    UIButton *myItemsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myItemsButton setFrame:CGRectMake(20, 90, 110, 50)];
    [myItemsButton setTitle:@"My Items" forState:UIControlStateNormal];
    [myItemsButton addTarget:self action:@selector(myItemsAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:myItemsButton];

    UIButton *itemStoreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [itemStoreButton setFrame:CGRectMake(20, 160, 110, 50)];
    [itemStoreButton setTitle:@"Item Store" forState:UIControlStateNormal];
    [itemStoreButton addTarget:self action:@selector(itemStoreAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainPetView addSubview:itemStoreButton];
}

- (void)buttonAction: (id) selector {
    NSLog(@"clicked on Pet button");
}

- (void)myItemsAction: (id) selector {
    NSLog(@"clicked on my items button");
    ItemsViewController *itemsViewController = [[ItemsViewController alloc] initWithNibName:@"ItemsViewController" bundle:nil];
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
    SwitchPetsViewController *switchPetsView = [[SwitchPetsViewController alloc] initWithNibName:@"SwitchPetsViewController" bundle:nil];
    SwitchPetsNavigationController *switchPetsNavigationController = [[SwitchPetsNavigationController alloc] initWithRootViewController:switchPetsView];
    [self presentViewController:switchPetsNavigationController animated:YES completion:nil];
}

- (void)viewHelp: (id) selector {
    NSLog(@"Opended the Help view");
    HelpViewController *helpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    HelpNavigationController *helpNavgationController = [[HelpNavigationController alloc] initWithRootViewController:helpView];
    [self presentViewController:helpNavgationController animated:YES completion:nil];
}




@end
