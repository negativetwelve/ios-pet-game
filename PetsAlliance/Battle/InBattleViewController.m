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
@synthesize bottomPet;
@synthesize opponent;
@synthesize user;
@synthesize battle;

@synthesize userPet;
@synthesize opponentPet;

@synthesize topHPBar;
@synthesize bottomHPBar;

@synthesize topCharBar;
@synthesize bottomCharBar;


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
    NSLog(@"opponent is '%@'", opponent.username);
    NSLog(@"I am '%@'", user.username);
    [self startBattle];
}

- (void)startBattle {
    NSLog(@"start battle");
    
    Pet *userCurrentPet = [self.user.userPets objectAtIndex:0];
    Pet *opponentCurrentPet = [self.opponent.opponentPets objectAtIndex:0];
    [self setUserPet:userCurrentPet];
    [self setOpponentPet:opponentCurrentPet];
    
    NSString *userChar = [NSString stringWithFormat:@"%@.png", self.user.character];
    NSString *opponentChar = [NSString stringWithFormat:@"%@.png", self.opponent.character];
    
    UIView *topCharSlideBar = [[UIView alloc] initWithFrame:CGRectMake(-320, 20, self.view.frame.size.width, 110)];
    [topCharSlideBar setNuiClass:@"StartBattleBar"];
    
    UIImageView *topCharImage = [[UIImageView alloc] initWithFrame:CGRectMake(265, 15, 40, 80)];
    [topCharImage setImage:[UIImage imageNamed:opponentChar]];
    [topCharSlideBar addSubview:topCharImage];
    
    [self.animationView addSubview:topCharSlideBar];

    UIView *bottomCharSlideBar = [[UIView alloc] initWithFrame:CGRectMake(320, 150, self.view.frame.size.width, 110)];
    [bottomCharSlideBar setNuiClass:@"StartBattleBar"];
    
    UIImageView *bottomCharImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 40, 80)];
    [bottomCharImage setImage:[UIImage imageNamed:userChar]];
    [bottomCharSlideBar addSubview:bottomCharImage];
    
    [self.animationView addSubview:bottomCharSlideBar];
    
    UIImageView *topCharImageBig = [[UIImageView alloc] initWithFrame:CGRectMake(-100, 15, 80, 160)];
    [topCharImageBig setImage:[UIImage imageNamed:opponentChar]];
    [self.animationView addSubview:topCharImageBig];

    UIImageView *bottomCharImageBig = [[UIImageView alloc] initWithFrame:CGRectMake(340, 100, 80, 160)];
    [bottomCharImageBig setImage:[UIImage imageNamed:userChar]];
    [self.animationView addSubview:bottomCharImageBig];
    
    UIImageView *topPetImage = [[UIImageView alloc] initWithFrame:CGRectMake(340, 10, 120, 120)];
    [topPetImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", opponentCurrentPet.name]]];
    [self.animationView addSubview:topPetImage];
    [self setTopPet:topPetImage];
    
    UIImageView *bottomPetImage = [[UIImageView alloc] initWithFrame:CGRectMake(-140, 160, 120, 120)];
    [bottomPetImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", userCurrentPet.name]]];
    [self.animationView addSubview:bottomPetImage];
    [self setBottomPet:bottomPetImage];

    
    OpponentBattleStatusView *opponentStatusView = [[OpponentBattleStatusView alloc] initWithFrame:CGRectMake(10, 20, 130, 45) andPet:opponentCurrentPet andInBattleController:self];
    [self.animationView addSubview:opponentStatusView];
    [opponentStatusView setHidden:YES];
    
    UserBattleStatusView *userStatusView = [[UserBattleStatusView alloc] initWithFrame:CGRectMake(180, 200, 130, 60) andPet:userCurrentPet andInBattleController:self];
    [self.animationView addSubview:userStatusView];
    [userStatusView setHidden:YES];
    

    [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [topCharSlideBar setFrame:CGRectMake(0, 20, 320, 110)];
        [bottomCharSlideBar setFrame:CGRectMake(0, 150, 320, 110)];
    } completion:^(BOOL finished){
        sleep(2);
        [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [topCharSlideBar setFrame:CGRectMake(320, 20, 320, 110)];
            [bottomCharSlideBar setFrame:CGRectMake(-320, 150, 320, 110)];
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
                                [opponentStatusView setHidden:NO];
                                [userStatusView setHidden:NO];
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
}

- (void)processBattleActions:(NSArray *)battleActions {
    NSLog(@"processing battle actions");
    
    float delay = 0;
    for (int i = 0; i < [battleActions count]; i++) {
        BattleAction *currentAction = [battleActions objectAtIndex:i];
        
        if ([currentAction.type isEqualToString:@"attack"]) {
            if ([currentAction.ownerType isEqualToString:@"user"]) {
                [AttackAnimationManager mainAttack:@"surf" forView:self.animationView withFrames:7 withDelay:delay];
                delay += 2.0;
                
                [AttackAnimationManager performSelector:@selector(flicker:) withObject:self.topPet afterDelay:delay];
                delay += 0.3;
                
                [self performSelector:@selector(changeHPBy:) withObject:@{@"amount": currentAction.opponentPetDamage, @"location": @"top"} afterDelay:delay];
                delay += 0.3;
                
                delay += 1;
                
            } else if ([currentAction.ownerType isEqualToString:@"opponent"]) {
                [AttackAnimationManager movementAttack:@"tackle" forPet:self.topPet withDelay:delay];
                delay += 0.3;

                [AttackAnimationManager performSelector:@selector(flicker:) withObject:self.bottomPet afterDelay:delay];
                delay += 0.3;
                
                [self performSelector:@selector(changeHPBy:) withObject:@{@"amount": currentAction.opponentPetDamage, @"location": @"bottom"} afterDelay:delay];
                delay += 0.3;
                
                delay += 1;
            }
            
            if (currentAction.battleFinished) {
                [self performSelector:@selector(closeBattleScreen) withObject:nil afterDelay:delay];
            }
        }
    }
}

- (void)closeBattleScreen {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)changeHPBy:(NSDictionary *)params {
    int amount = [[params objectForKey:@"amount"] intValue];
    NSString *pet = [params objectForKey:@"location"];

    NSLog(@"changing hp by %d", amount);

    if ([pet isEqualToString:@"top"]) {
        float newAmount = ([self.opponentPet.currHp floatValue] - amount) / [self.opponentPet.maxHp floatValue];
        NSLog(@"new amount: %f", newAmount);
        [self.topCharBar setProgress:newAmount animated:YES];
        self.opponentPet.currHp = [NSNumber numberWithInt:[self.opponentPet.currHp intValue] - amount];
        
        if (self.topCharBar.progress == 0) {
            [AttackAnimationManager faint:self.topPet];
        }
    } else {
        float newAmount = ([self.userPet.currHp floatValue] - amount) / [self.userPet.maxHp floatValue];
        NSLog(@"new amount: %f", newAmount);
        [self.bottomCharBar setProgress:newAmount animated:YES];
        self.userPet.currHp = [NSNumber numberWithInt:[self.userPet.currHp intValue] - amount];
        
        if (self.bottomCharBar.progress == 0) {
            [AttackAnimationManager faint:self.bottomPet];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
