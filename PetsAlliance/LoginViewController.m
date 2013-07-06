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
@synthesize pager = _pager;
@synthesize mainScrollView = _mainScrollView;
@synthesize male = _male;
@synthesize female = _female;
@synthesize nextButton = _nextButton;
@synthesize maleButton = _maleButton;
@synthesize femaleButton = _femaleButton;
@synthesize accountButton = _accountButton;
@synthesize resetButton = _resetButton;
@synthesize usernameField = _usernameField;
@synthesize verifiedText = _verifiedText;

@synthesize originalCenter = _originalCenter;
@synthesize numCharacters = _numCharacters;
@synthesize characterViews = _characterViews;

@synthesize myPetViewController = _myPetViewController;

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

- (id)init:(MyPetViewController *)petView {
    self = [self init];
    self.myPetViewController = petView;
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
    [self.view insertSubview:scrollView atIndex:0];
    
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
    [boyButton setNuiClass:@"Button:TextFieldButton"];
    [boyButton setFrame:CGRectMake(25, 260, 110, 31)];
    [boyButton addTarget:self action:@selector(selectBoyAction:) forControlEvents:UIControlEventTouchUpInside];
    [boyButton setTag:1];
    [self.view addSubview:boyButton];
    [self setMaleButton:boyButton];
    
    UIButton *girlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [girlButton setTitle:@"Girl" forState:UIControlStateNormal];
    [girlButton setNuiClass:@"Button:TextFieldButton"];
    [girlButton setFrame:CGRectMake(185, 260, 110, 31)];
    [girlButton addTarget:self action:@selector(selectGirlAction:) forControlEvents:UIControlEventTouchUpInside];
    [girlButton setTag:1];
    [self.view addSubview:girlButton];
    [self setFemaleButton:girlButton];
    
    UIButton *haveAccountButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [haveAccountButton setTitle:@"Already have an account?" forState:UIControlStateNormal];
    [haveAccountButton setNuiClass:@"Button:LargeButton"];
    [haveAccountButton setFrame:CGRectMake(25, 320, 270, 50)];
    [haveAccountButton addTarget:self action:@selector(haveAccount:) forControlEvents:UIControlEventTouchUpInside];
    [firstChar addSubview:haveAccountButton];
    [self setAccountButton:haveAccountButton];
    
    UITextField *usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 310, 140, 31)];
    [usernameTextField setPlaceholder:@"Username"];
    [usernameTextField setReturnKeyType:UIReturnKeyDone];
    [usernameTextField setTag:999];
    [usernameTextField setDelegate:self];
    [usernameTextField setNuiClass:@"TextField"];
    [usernameTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [usernameTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [usernameTextField setHidden:YES];
    [self setUsernameField:usernameTextField];
    [self.view addSubview:usernameTextField];
    
    UILabel *verified = [[UILabel alloc] initWithFrame:CGRectMake(20, 350, 280, 20)];
    [verified setText:@"Sorry, that username is taken."];
    [verified setNuiClass:@"DenyText"];
    [verified setHidden:YES];
    [self setVerifiedText:verified];
    [self.view addSubview:verified];
    
    [firstChar setMaleAndFemale];
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    [pageControl setFrame:CGRectMake(110,5,100,10)];
    [pageControl setPageIndicatorTintColor:[UIColor grayColor]];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    [pageControl setNumberOfPages:self.numCharacters];
    [pageControl setCurrentPage:0];
    [pageControl setHidden:YES];
    [self setPager:pageControl];
    [self.view addSubview:pageControl];
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
    NSLog(@"text field should return");
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        [self verifyUsernameWithSuccessBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSDictionary *jsonResponse = (NSDictionary *)JSON;
            NSLog(@"returned json: %@", jsonResponse);
            [self usernameVerified:jsonResponse];
        } andFailBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            NSDictionary *jsonResponse = (NSDictionary *)JSON;
            NSLog(@"error: %@", error);
            [self usernameNotVerified:jsonResponse];
        }];
    }
    return NO;
}

- (UIButton *)makeGoBackButton: (NSString *)gender {
    UIButton *goBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [goBack setTitle:[NSString stringWithFormat:@"I'm actually a %@!", gender] forState:UIControlStateNormal];
    [goBack setNuiClass:@"Button:SmallButton"];
    [goBack setFrame:CGRectMake(25, 380, 270, 24)];
    [goBack setHidden:YES];
    [goBack setAlpha:0];
    [goBack addTarget:self action:@selector(resetView:) forControlEvents:UIControlEventTouchUpInside];
    return goBack;
}

- (void)selectBoyAction: (id)selector {
    NSLog(@"clicked on boy button");
    UIButton *button = (UIButton *)selector;
    NSLog(@"%d", button.tag);
    if (button.tag == 1) {
        [self loadCharacters:@"male"];
        
        [button removeTarget:self action:@selector(selectBoyAction:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(selectCharacterAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)selectGirlAction: (id)selector {
    NSLog(@"clicked on girl button");
    UIButton *button = (UIButton *)selector;
    if (button.tag == 1) {
        [self loadCharacters:@"female"];
        
        [button removeTarget:self action:@selector(selectGirlAction:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(selectCharacterAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)resetCharacterInfo: (NSString *)gender {
    NSLog(@"%@", self.maleButton);
    [self.maleButton removeTarget:self action:@selector(selectCharacterAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.femaleButton removeTarget:self action:@selector(selectCharacterAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.maleButton addTarget:self action:@selector(selectBoyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.femaleButton addTarget:self action:@selector(selectGirlAction:) forControlEvents:UIControlEventTouchUpInside];
    for(int i = 0; i < [self.characterViews count]; i++) {
        SelectCharacterView *characterView = (SelectCharacterView *)[self.characterViews objectAtIndex:i];
        [characterView.character setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%d.png", gender, i + 2]]];
        if ([gender isEqualToString:@"female"]) {
            [characterView.selectButton setTag:2];
        } else {
            [characterView.selectButton setTag:3];
        }
    }
}

- (void)resetView: (id)selector {
    NSLog(@"reset view");
    [self.usernameField resignFirstResponder];
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
                         
                         [self.usernameField setAlpha:0];
                         [self.usernameField setHidden:YES];
                         
                         [self.verifiedText setAlpha:0];
                         [self.verifiedText setHidden:YES];
                         
                         [self.mainScrollView setScrollEnabled:NO];
                         [self.pager setHidden:YES];
                         
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
                             
                             [self.femaleButton setTransform:CGAffineTransformMakeTranslation(0, 50)];
                             [self.femaleButton setTitle:@"Select" forState:UIControlStateNormal];
                             [self.femaleButton setTag:2];
                             
                             [self.accountButton setAlpha:0];
                             
                             [self.nextButton setHidden:NO];
                             [self.nextButton setAlpha:1];
                             
                             [self.resetButton setHidden:NO];
                             [self.resetButton setAlpha:1];
                             
                             [self.usernameField setHidden:NO];
                             [self.usernameField setAlpha:1];
                             
                             [self.mainScrollView setScrollEnabled:YES];
                             [self.pager setHidden:NO];
                             
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
                             
                             [self.maleButton setTransform:CGAffineTransformMakeTranslation(160, 50)];
                             [self.maleButton setTitle:@"Select" forState:UIControlStateNormal];
                             [self.maleButton setTag:3];
                             
                             [self.accountButton setAlpha:0];
                             
                             [self.nextButton setHidden:NO];
                             [self.nextButton setAlpha:1];
                             
                             [self.resetButton setHidden:NO];
                             [self.resetButton setAlpha:1];
                             
                             [self.usernameField setHidden:NO];
                             [self.usernameField setAlpha:1];
                             
                             [self.mainScrollView setScrollEnabled:YES];
                             [self.pager setHidden:NO];
                             
                             [self.view addSubview:reset];
                         } completion:^(BOOL finished) {
                             
                         }];
    }
}

- (void)selectCharacter: (NSString *)character withName:(NSString *)username {
    NSMutableDictionary *params = ((LoginNavigationController *)self.navigationController).params;
    [params setObject:character forKey:@"character"];
    [params setObject:username forKey:@"username"];
    
    FirstPetViewController *firstPetViewController = [[FirstPetViewController alloc] init:self.myPetViewController];
    [self.navigationController pushViewController:firstPetViewController animated:YES];
}

- (void)selectCharacterAction: (id)selector {
    NSLog(@"called from select button");
    [self.usernameField resignFirstResponder];
    UIButton *button = (UIButton *)selector;
    NSString *gender;
    if (button.tag == 2) {
        gender = @"female";
    } else {
        gender = @"male";
    }
    int page = self.mainScrollView.contentOffset.x / self.mainScrollView.frame.size.width;
    NSLog(@"%@%d", gender, page);
    
    [self verifyUsernameWithSuccessBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSDictionary *jsonResponse = (NSDictionary *)JSON;
        NSLog(@"returned json: %@", jsonResponse);
        [self usernameVerified:jsonResponse];
        NSString *username = [[jsonResponse objectForKey:@"success"] objectForKey:@"username"];
        [self selectCharacter:[NSString stringWithFormat:@"%@%d", gender, page + 1] withName:username];
    } andFailBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSDictionary *jsonResponse = (NSDictionary *)JSON;
        NSLog(@"error: %@", error);
        [self usernameNotVerified:jsonResponse];
        
    }];
}

- (void)usernameVerified: (NSDictionary *)jsonResponse {
    if ([jsonResponse objectForKey:@"success"]) {
        [NUILabelRenderer render:self.verifiedText withClass:@"ConfirmText"];
        [self.verifiedText setText:@"Success! That username is available."];
        [self.verifiedText setHidden:NO];
        [self.verifiedText setAlpha:1];
    } else {
        [NUILabelRenderer render:self.verifiedText withClass:@"DenyText"];
        NSString *failText = [[jsonResponse objectForKey:@"error"] objectForKey:@"reason"];
        [self.verifiedText setText:failText];
        [self.verifiedText setHidden:NO];
        [self.verifiedText setAlpha:1];
    }
}

- (void)usernameNotVerified: (NSDictionary *)jsonResponse {
    [NUILabelRenderer render:self.verifiedText withClass:@"DenyText"];
    NSString *failText = [[jsonResponse objectForKey:@"error"] objectForKey:@"reason"];
    [self.verifiedText setText:failText];
    [self.verifiedText setHidden:NO];
    [self.verifiedText setAlpha:1];
}


- (void)verifyUsernameWithSuccessBlock:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))successBlock andFailBlock:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failBlock {
    NSLog(@"checking username");
    NSString *inputUsername = self.usernameField.text;
    NSLog(@"%@", inputUsername);
    NSDictionary *params = @{};
    if (inputUsername != nil) {
        params = @{@"username":inputUsername};
    } else {
        params = @{@"username":@""};
    }
    
    RKObjectManager *manager = [RKObjectManager sharedManager];
    AFHTTPClient *client = [manager HTTPClient];
    
    NSMutableURLRequest *request = [client requestWithMethod:@"POST" path:@"account/check" parameters:params];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading";
    
    AFJSONRequestOperation *checkUsername = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [hud hide:YES];
        successBlock(request, response, JSON);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        [hud hide:YES];
        failBlock(request, response, error, JSON);
    }];
    
    [client enqueueHTTPRequestOperation:checkUsername];
}

- (void)haveAccount: (id)selector {
    NSLog(@"have account");
    HaveAcccountViewController *haveAccount = [[HaveAcccountViewController alloc] init:self.myPetViewController];
    [self.navigationController pushViewController:haveAccount animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
