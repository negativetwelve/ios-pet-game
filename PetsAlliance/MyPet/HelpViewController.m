//
//  HelpViewController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/11/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Help";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(closeHelp:)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HelpView *helpView = [[HelpView alloc] initWithFrame:self.parentViewController.view.frame];
    [self.view addSubview:helpView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)closeHelp: (id) selector {
    NSLog(@"close help");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
