//
//  HaveAcccountViewController.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/22/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "HaveAcccountViewController.h"

@interface HaveAcccountViewController ()

@end

@implementation HaveAcccountViewController
@synthesize myPetViewController;
@synthesize verifiedText = _verifiedText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Login";
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
    
    UITextField *emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 50, 280, 31)];
    [emailTextField setPlaceholder:@"Email"];
    [emailTextField setReturnKeyType:UIReturnKeyNext];
    [emailTextField setTag:1];
    [emailTextField setNuiClass:@"TextField"];
    [emailTextField setDelegate:self];
    [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [emailTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.view addSubview:emailTextField];
    
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 90, 280, 31)];
    [passwordTextField setPlaceholder:@"Password"];
    [passwordTextField setReturnKeyType:UIReturnKeyDone];
    [passwordTextField setTag:2];
    [passwordTextField setDelegate:self];
    [passwordTextField setNuiClass:@"TextField"];
    [passwordTextField setSecureTextEntry:YES];
    [self.view addSubview:passwordTextField];
    
    UILabel *verified = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, 280, 20)];
    [verified setText:@""];
    [verified setNuiClass:@"DenyText"];
    [verified setHidden:YES];
    [self setVerifiedText:verified];
    [self.view addSubview:verified];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setTitle:@"Go!" forState:UIControlStateNormal];
    [submitButton setNuiClass:@"Button:TextFieldButton"];
    [submitButton setFrame:CGRectMake(220, 155, 80, 31)];
    [submitButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        [self submitAction:textField];
    }
    return NO;
}

- (void)submitAction: (id)selector {
    NSLog(@"submitting");
    
    // send to server
    NSString *encryptionKey = @"IQPRZUDGWWCGVGHTKHRPEQAYPPAQXASH";
    UIView *signUpView = ((UIView *)selector).superview;
    NSString *email = ((UITextField *)[signUpView.subviews objectAtIndex:0]).text;
    email = [AESCrypt encrypt:email password:encryptionKey];
    NSString *password = ((UITextField *)[signUpView.subviews objectAtIndex:1]).text;
    password = [AESCrypt encrypt:password password:encryptionKey];

    NSUUID *vendorIdObject = [[UIDevice currentDevice] identifierForVendor];
    NSString *uuid = [vendorIdObject UUIDString];
    NSDictionary *user = @{@"app_id":uuid, @"email":email, @"password":password};
    NSDictionary *auth = @{@"user":user};

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading";

    NSMutableURLRequest *request = [[RKObjectManager sharedManager] requestWithObject:nil method:RKRequestMethodPOST path:@"account/login" parameters:auth];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ User.userResponseDescriptor, Pet.responseDescriptor, Success.responseDescriptor, Error.responseDescriptor ]];
    
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"keychainID" accessGroup:nil];
        [keychain setObject:email forKey:(__bridge id)(kSecAttrAccount)];
        [keychain setObject:password forKey:(__bridge id)(kSecValueData)];
        
        User *user = [mappingResult.dictionary objectForKey:@"user"];
        
        NSLog(@"%@", user);
        NSLog(@"%@", self.myPetViewController);
        
        [self.myPetViewController loadUser:user andPets:user.userPets];
        
        [hud hide:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [hud hide:YES];
        NSLog(@"error!");
        NSString *errorMessage = ((Error *)[[error.userInfo objectForKey:RKObjectMapperErrorObjectsKey] firstObject]).reason;
        NSLog(@"%@", errorMessage);
        [self authNotVerified:errorMessage];
    }];
    
    [[RKObjectManager sharedManager] enqueueObjectRequestOperation:objectRequestOperation];
}

- (void)authNotVerified: (NSString *)reason {
    NSLog(@"not verified");
    [NUILabelRenderer render:self.verifiedText withClass:@"DenyText"];
    [self.verifiedText setText:reason];
    [self.verifiedText setHidden:NO];
    [self.verifiedText setAlpha:1];
    NSLog(@"%@", reason);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
