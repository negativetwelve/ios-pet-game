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
@synthesize animationView;
@synthesize topPet;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.nuiClass = @"DefaultView";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int battleAnimationHeight = 280;
    BattleAnimationView *battleAnimationView = [[BattleAnimationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, battleAnimationHeight)];
    [self setAnimationView:battleAnimationView];
    [self.view addSubview:battleAnimationView];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, battleAnimationHeight, self.view.frame.size.width, self.view.frame.size.height - battleAnimationHeight)];
    containerView.backgroundColor = [UIColor whiteColor];
    BattleOptionsView *battleOptionsView = [[BattleOptionsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [battleOptionsView setInBattleController:self];
    [containerView addSubview:battleOptionsView];

    [self.view addSubview:containerView];
}

- (void)viewDidAppear:(BOOL)animated {
    [self startBattle];
}

- (void)startBattle {
    NSLog(@"start battle");
    UIView *topCharBar = [[UIView alloc] initWithFrame:CGRectMake(-320, 20, self.view.frame.size.width, 110)];
    [topCharBar setBackgroundColor:[UIColor blueColor]];
    
    UIImageView *topCharImage = [[UIImageView alloc] initWithFrame:CGRectMake(265, 15, 40, 80)];
    [topCharImage setImage:[UIImage imageNamed:@"male2.png"]];
    [topCharBar addSubview:topCharImage];
    
    [self.animationView addSubview:topCharBar];

    UIView *bottomCharBar = [[UIView alloc] initWithFrame:CGRectMake(320, 150, self.view.frame.size.width, 110)];
    [bottomCharBar setBackgroundColor:[UIColor greenColor]];
    
    UIImageView *bottomCharImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 40, 80)];
    [bottomCharImage setImage:[UIImage imageNamed:@"male1.png"]];
    [bottomCharBar addSubview:bottomCharImage];
    
    [self.animationView addSubview:bottomCharBar];
    
    UIImageView *topCharImageBig = [[UIImageView alloc] initWithFrame:CGRectMake(-100, 15, 80, 160)];
    [topCharImageBig setImage:[UIImage imageNamed:@"male2.png"]];
    [self.animationView addSubview:topCharImageBig];

    UIImageView *bottomCharImageBig = [[UIImageView alloc] initWithFrame:CGRectMake(340, 100, 80, 160)];
    [bottomCharImageBig setImage:[UIImage imageNamed:@"male1.png"]];
    [self.animationView addSubview:bottomCharImageBig];
    
    UIImageView *topPetImage = [[UIImageView alloc] initWithFrame:CGRectMake(340, 10, 120, 120)];
    [topPetImage setImage:[UIImage imageNamed:@"reptiling.png"]];
    [self.animationView addSubview:topPetImage];
    [self setTopPet:topPetImage];
    
    UIImageView *bottomPetImage = [[UIImageView alloc] initWithFrame:CGRectMake(-200, 160, 120, 120)];
    [bottomPetImage setImage:[UIImage imageNamed:@"dratlantic.png"]];
    [self.animationView addSubview:bottomPetImage];
    
    [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [topCharBar setFrame:CGRectMake(0, 20, 320, 110)];
        [bottomCharBar setFrame:CGRectMake(0, 150, 320, 110)];
    } completion:^(BOOL finished){
        sleep(2);
        [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [topCharBar setFrame:CGRectMake(320, 20, 320, 110)];
            [bottomCharBar setFrame:CGRectMake(-320, 150, 320, 110)];
        } completion:^(BOOL finished){
            [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseIn animations:^{
                [topCharImageBig setFrame:CGRectMake(220, 15, 80, 160)];
                [bottomCharImageBig setFrame:CGRectMake(20, 100, 80, 160)];
            } completion:^(BOOL finished){
                sleep(1);
                [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [topCharImageBig setFrame:CGRectMake(340, 15, 80, 160)];
                } completion:^(BOOL finished){
                    sleep(1);
                    [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseIn animations:^{
                        [topPetImage setFrame:CGRectMake(190, 10, 120, 120)];
                    } completion:^(BOOL finished){
                        sleep(1);
                        [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseOut animations:^{
                            [bottomCharImageBig setFrame:CGRectMake(-100, 100, 80, 160)];
                        } completion:^(BOOL finished){
                            sleep(1);
                            [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                [bottomPetImage setFrame:CGRectMake(10, 160, 120, 120)];
                            } completion:^(BOOL finished){
                                
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
