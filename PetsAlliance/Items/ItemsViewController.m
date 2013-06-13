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
    
    PetStatusView *petStatusView = [[PetStatusView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [self.view addSubview:petStatusView];
    
    ItemsNavigationScrollView *itemsNavigationScrollView = [[ItemsNavigationScrollView alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    [self.view addSubview:itemsNavigationScrollView];
    
    ItemsTableView *itemsTableView = [[ItemsTableView alloc] initWithFrame:CGRectMake(0, 130, 320, self.view.bounds.size.height)];
    [self.view addSubview:itemsTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
