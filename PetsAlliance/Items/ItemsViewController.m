//
//  ItemsViewController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/13/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"My Items";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(closeMyItemsView:)];
        // Custom initialization
    }
    return self;
}

- (void)closeMyItemsView: (id)selector {
    NSLog(@"close my items view");
    [self dismissViewControllerAnimated:YES completion:nil];   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int petStatusViewHeight = 100;
    int navHeight = self.tabBarController.tabBar.frame.size.height + self.navigationController.navigationBar.frame.size.height;
    
    PetStatusView *petStatusView = [[PetStatusView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, petStatusViewHeight)];
    [self.view addSubview:petStatusView];
    
    int itemsNavigationHeight = 30;
    ItemsNavigationScrollView *itemsNavigationScrollView = [[ItemsNavigationScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, itemsNavigationHeight)];
    [self.view addSubview:itemsNavigationScrollView];
    
    ItemsTableView *itemsTableView = [[ItemsTableView alloc] initWithFrame:CGRectMake(0, 100 + itemsNavigationHeight, self.view.frame.size.width, self.view.frame.size.height - navHeight - 100 - itemsNavigationHeight)];
    [self.view addSubview:itemsTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
