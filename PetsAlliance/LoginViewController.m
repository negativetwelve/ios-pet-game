//
//  LoginViewController.m
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/16/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize mainScrollView = _mainScrollView;
@synthesize male = _male;
@synthesize female = _female;
@synthesize nextButton = _nextButton;
@synthesize maleButton = _maleButton;
@synthesize femaleButton = _femaleButton;
@synthesize accountButton = _accountButton;
@synthesize resetButton = _resetButton;

@synthesize originalCenter = _originalCenter;
@synthesize numCharacters = _numCharacters;
@synthesize characterViews = _characterViews;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Welcome!";
        self.numCharacters = 3;
        self.characterViews = [[NSMutableArray alloc] init];
        self.view.nuiClass = @"DefaultView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.originalCenter = CGPointMake(self.view.center.x, self.view.center.y - 44); // HACK, need to fix.
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scrollView setContentSize:CGSizeMake(self.numCharacters * 320, self.view.frame.size.height)];
    [scrollView setScrollEnabled:NO];
    [scrollView setPagingEnabled:YES];
    [self setMainScrollView:scrollView];
    [self.view addSubview:scrollView];
    
    SelectCharacterView *firstChar = [[SelectCharacterView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andIndex:0 andImage:@"male1.png"];
    [firstChar setViewController:self];
    [scrollView addSubview:firstChar];

    for(int i = 1; i < self.numCharacters; i++) {
        SelectCharacterView *character = [[SelectCharacterView alloc] initWithFrame:CGRectMake(i * 320, 0, self.view.frame.size.width, self.view.frame.size.height) andIndex:i andImage:[NSString stringWithFormat:@"male%d.png", i + 1]];
        [character setViewController:self];
        [self.characterViews addObject:character];
    }
    
    for(int i = 0; i < [self.characterViews count]; i++) {
        [scrollView addSubview:[self.characterViews objectAtIndex:i]];
    }
    
    UIButton *boyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [boyButton setTitle:@"Boy" forState:UIControlStateNormal];
    [boyButton setNuiClass:@"Button:LargeButton"];
    [boyButton setFrame:CGRectMake(25, 260, 110, 50)];
    [boyButton addTarget:self action:@selector(selectBoyAction:) forControlEvents:UIControlEventTouchUpInside];
    [boyButton setTag:1];
    [firstChar addSubview:boyButton];
    [firstChar setMaleButton:boyButton];
    
    UIButton *girlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [girlButton setTitle:@"Girl" forState:UIControlStateNormal];
    [girlButton setNuiClass:@"Button:LargeButton"];
    [girlButton setFrame:CGRectMake(185, 260, 110, 50)];
    [girlButton addTarget:self action:@selector(selectGirlAction:) forControlEvents:UIControlEventTouchUpInside];
    [girlButton setTag:1];
    [firstChar addSubview:girlButton];
    [firstChar setFemaleButton:girlButton];
    
    UIButton *haveAccountButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [haveAccountButton setTitle:@"Already have an account?" forState:UIControlStateNormal];
    [haveAccountButton setNuiClass:@"Button:LargeButton"];
    [haveAccountButton setFrame:CGRectMake(25, 350, 270, 50)];
    [haveAccountButton addTarget:self action:@selector(haveAccount:) forControlEvents:UIControlEventTouchUpInside];
    [firstChar addSubview:haveAccountButton];
    [self setAccountButton:haveAccountButton];
    
    UITextField *usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 360, 140, 31)];
    [usernameTextField setPlaceholder:@"Username"];
    [usernameTextField setReturnKeyType:UIReturnKeyDone];
    [usernameTextField setTag:1];
    [usernameTextField setDelegate:self];
    [usernameTextField setNuiClass:@"TextField"];
    [usernameTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [usernameTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.view addSubview:usernameTextField];
    
    [firstChar setMaleAndFemale];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x, self.originalCenter.y - 216);
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = self.originalCenter;
    [UIView commitAnimations];
}


- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        // do something
    }
    return NO;
}

- (UIButton *)makeGoBackButton: (NSString *)gender {
    UIButton *goBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [goBack setTitle:[NSString stringWithFormat:@"I'm actually a %@!", gender] forState:UIControlStateNormal];
    [goBack setNuiClass:@"Button:SmallButton"];
    [goBack setFrame:CGRectMake(25, 440, 270, 50)];
    [goBack addTarget:self action:@selector(resetView:) forControlEvents:UIControlEventTouchUpInside];
    return goBack;
}

- (void)selectBoyAction: (id)selector {
    NSLog(@"clicked on boy button");
    UIButton *button = (UIButton *)selector;
    if (button.tag == 1) {
        [self loadCharacters:@"male"];
        [button addTarget:self action:@selector(selectCharacterAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)selectGirlAction: (id)selector {
    NSLog(@"clicked on girl button");
    UIButton *button = (UIButton *)selector;
    if (button.tag == 1) {
        [self loadCharacters:@"female"];
        [button addTarget:self action:@selector(selectCharacterAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)resetCharacterInfo: (NSString *)gender {
    for(int i = 0; i < [self.characterViews count]; i++) {
        [((SelectCharacterView *)[self.characterViews objectAtIndex:i]).character setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%d.png", gender, i + 2]]];
    }
}

- (void)resetView: (id)selector {
    NSLog(@"reset view");
    [self resetCharacterInfo:@"male"];
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^(void) {
                         [self.mainScrollView scrollRectToVisible:CGRectMake(0, 0, 320, self.mainScrollView.frame.size.height) animated:YES];
                         
                         [self.male setAlpha:1];
                         [self.male setTransform:CGAffineTransformIdentity];
                         
                         [self.maleButton setAlpha:1];
                         [self.maleButton setTitle:@"Boy" forState:UIControlStateNormal];
                         [self.maleButton setTag:1];
                         [self.maleButton setTransform:CGAffineTransformIdentity];

                         [self.female setAlpha:1];
                         [self.female setTransform:CGAffineTransformIdentity];
                         
                         [self.femaleButton setAlpha:1];
                         [self.femaleButton setTitle:@"Girl" forState:UIControlStateNormal];
                         [self.femaleButton setTag:1];
                         [self.femaleButton setTransform:CGAffineTransformIdentity];

                         [self.accountButton setAlpha:1];
                         
                         [self.nextButton setAlpha:0];
                         [self.nextButton setHidden:YES];
                         
                         [self.mainScrollView setScrollEnabled:NO];
                         
                         [self.resetButton removeFromSuperview];
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (void)loadCharacters: (NSString *)gender {
    if ([gender isEqualToString:@"female"]) {
        NSLog(@"fading boy");
        UIButton *reset = [self makeGoBackButton:@"boy"];
        [self setResetButton:reset];
        [self resetCharacterInfo:@"female"];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^(void) {
                             [self.male setAlpha:0];
                             
                             [self.maleButton setAlpha:0];
                             
                             [self.female setTransform:CGAffineTransformMakeTranslation(-80, 0)];
                             
                             [self.femaleButton setTransform:CGAffineTransformMakeTranslation(-80, 100)];
                             [self.femaleButton setTitle:@"Select" forState:UIControlStateNormal];
                             [self.femaleButton setTag:2];
                             
                             [self.accountButton setAlpha:0];
                             
                             [self.nextButton setHidden:NO];
                             [self.nextButton setAlpha:1];
                             
                             [self.mainScrollView setScrollEnabled:YES];
                             
                             [self.view addSubview:reset];
                         } completion:^(BOOL finished) {

                         }];
    } else {
        NSLog(@"fading girl");
        UIButton *reset = [self makeGoBackButton:@"girl"];
        [self setResetButton:reset];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^(void) {
                             [self.female setAlpha:0];
                             
                             [self.femaleButton setAlpha:0];
                             
                             [self.male setTransform:CGAffineTransformMakeTranslation(80, 0)];
                             
                             [self.maleButton setTransform:CGAffineTransformMakeTranslation(80, 100)];
                             [self.maleButton setTitle:@"Select" forState:UIControlStateNormal];
                             [self.maleButton setTag:2];
                             
                             [self.accountButton setAlpha:0];
                             
                             [self.nextButton setHidden:NO];
                             [self.nextButton setAlpha:1];
                             
                             [self.mainScrollView setScrollEnabled:YES];
                             
                             [self.view addSubview:reset];
                         } completion:^(BOOL finished) {
                             
                         }];
    }
}

- (void)selectCharacter: (NSString *)character withName:(NSString *)username {
    NSMutableDictionary *params = ((LoginNavigationController *)self.navigationController).params;
    [params setObject:character forKey:@"character"];
    [params setObject:username forKey:@"username"];
    FirstPetViewController *firstPetViewController = [[FirstPetViewController alloc] init];
    [self.navigationController pushViewController:firstPetViewController animated:YES];
}

- (void)selectCharacterAction: (id)selector {
    NSLog(@"called from select button");
    UIButton *button = (UIButton *)selector;
    SelectCharacterView *charView = (SelectCharacterView *)button.superview;
    NSLog(@"%d", charView.index);
}

- (void)haveAccount: (id)selector {
    NSLog(@"have account");
    HaveAcccountViewController *haveAccount = [[HaveAcccountViewController alloc] init];
    [self.navigationController pushViewController:haveAccount animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
