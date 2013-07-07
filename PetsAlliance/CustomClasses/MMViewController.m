//
//  MMViewController.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 7/7/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.trackedViewName = self.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
