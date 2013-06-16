//
//  InBattleViewController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "InBattleViewController.h"

@interface InBattleViewController ()

@end

@implementation InBattleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int battleAnimationHeight = 280;
    BattleAnimationView *battleAnimationView = [[BattleAnimationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, battleAnimationHeight)];
    [self.view addSubview:battleAnimationView];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, battleAnimationHeight, self.view.frame.size.width, self.view.frame.size.height - battleAnimationHeight)];
    containerView.backgroundColor = [UIColor whiteColor];
    BattleOptionsView *battleOptionsView = [[BattleOptionsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [battleOptionsView setInBattleController:self];
    [containerView addSubview:battleOptionsView];

    [self.view addSubview:containerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
