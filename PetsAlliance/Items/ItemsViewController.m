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
@synthesize petStatusView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"My Items";
    }
    return self;
}

- (id)initWithPetStatusView:(PetStatusView *)petStatus {
    self = [self init];
    if (self) {
        self.petStatusView = petStatus;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.view addSubview:petStatusView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int navHeight = self.tabBarController.tabBar.frame.size.height + self.navigationController.navigationBar.frame.size.height;
    int itemsNavigationHeight = 30;

    ItemsNavigationScrollView *itemsNavigationScrollView = [[ItemsNavigationScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, itemsNavigationHeight)];
    [self.view addSubview:itemsNavigationScrollView];
    
    ItemsTableView *itemsTableView = [[ItemsTableView alloc] initWithFrame:CGRectMake(0, 100 + itemsNavigationHeight, self.view.bounds.size.width, self.view.bounds.size.height - navHeight - 100 - itemsNavigationHeight)];
    [itemsTableView setDataSource:self];
    [itemsTableView setDelegate:self];
    [self.view addSubview:itemsTableView];
}

#pragma mark UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"identifier";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton *sellButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [sellButton setFrame:CGRectMake(230, 35, 80, 37)];
        [sellButton addTarget:self action:@selector(sellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [sellButton setTitle:@"Sell" forState:UIControlStateNormal];
        [sellButton setNuiClass:@"SecondaryButton"];
        [cell addSubview:sellButton];
        
        UILabel *itemName = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 120, 15)];
        [itemName setText:@"Blue Armor"];
        [itemName setNuiClass:@"Label:BattleBoldText"];
        [cell addSubview:itemName];
        
        UIImageView *itemImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 60, 60)];
        [itemImage setImage:[UIImage imageNamed:@"blue_armor.png"]];
        [cell addSubview:itemImage];
    }
    cell.tag = indexPath.row;
    return cell;
}

- (void)updateTable: (UITableView *)tableView {
    [tableView beginUpdates];
    [tableView endUpdates];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)sellButtonPressed: (id)selector {
    NSLog(@"sell button pressed");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
