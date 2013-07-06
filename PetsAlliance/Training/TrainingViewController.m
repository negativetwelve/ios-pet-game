//
//  TrainingViewController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/12/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "TrainingViewController.h"

@interface TrainingViewController ()

@end

@implementation TrainingViewController
@synthesize petStatusView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Quests";
    }
    return self;
}

- (id)initWithPetStatusView:(PetStatusView *)petStatus {
    self = [self init];
    if (self) {
        self.title = @"Quests";
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
    UITableView *trainingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - navHeight - 100)];
    [self.view addSubview:trainingTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
