//
//  TrainingNavigationController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/12/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "TrainingNavigationController.h"

@interface TrainingNavigationController ()

@end

@implementation TrainingNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationBar.barStyle = UIBarStyleBlackOpaque;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
