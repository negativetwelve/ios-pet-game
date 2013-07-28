//
//  SignUpViewController.m
//  Pets Alliance
//
//  Created by Mark Miyashita on 6/19/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize originalCenter = _originalCenter;
@synthesize verifiedText = _verifiedText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Account";
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

    UITextField *emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 280, 31)];
    [emailTextField setPlaceholder:@"Email"];
    [emailTextField setReturnKeyType:UIReturnKeyNext];
    [emailTextField setTag:1];
    [emailTextField setNuiClass:@"TextField"];
    [emailTextField setDelegate:self];
    [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [emailTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.view addSubview:emailTextField];

    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 180, 280, 31)];
    [passwordTextField setPlaceholder:@"Password"];
    [passwordTextField setReturnKeyType:UIReturnKeyNext];
    [passwordTextField setTag:2];
    [passwordTextField setDelegate:self];
    [passwordTextField setNuiClass:@"TextField"];
    [passwordTextField setSecureTextEntry:YES];
    [self.view addSubview:passwordTextField];
    
    UITextField *passwordConfirmationTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 220, 280, 31)];
    [passwordConfirmationTextField setPlaceholder:@"Password Confirmation"];
    [passwordConfirmationTextField setReturnKeyType:UIReturnKeyDone];
    [passwordConfirmationTextField setTag:3];
    [passwordConfirmationTextField setDelegate:self];
    [passwordConfirmationTextField setNuiClass:@"TextField"];
    [passwordConfirmationTextField setSecureTextEntry:YES];
    [passwordConfirmationTextField addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:passwordConfirmationTextField];
    
    UILabel *verified = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, 280, 20)];
    [verified setText:@""];
    [verified setNuiClass:@"DenyText"];
    [verified setHidden:YES];
    [self setVerifiedText:verified];
    [self.view addSubview:verified];

    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setTitle:@"Submit!" forState:UIControlStateNormal];
    [submitButton setNuiClass:@"Button:LargeButton"];
    [submitButton setFrame:CGRectMake(70, 300, 180, 50)];
    [submitButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
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
    NSString *passwordConfirmation = ((UITextField *)[signUpView.subviews objectAtIndex:2]).text;
    passwordConfirmation = [AESCrypt encrypt:passwordConfirmation password:encryptionKey];
    NSMutableDictionary *params = ((LoginNavigationController *)self.navigationController).params;
    NSLog(@"PARAMS: %@", params);
    NSString *username = [params valueForKey:@"username"];
    NSString *character = [params valueForKey:@"character"];
    NSString *name = [params valueForKey:@"name"];
    
    NSUUID *vendorIdObject = [[UIDevice currentDevice] identifierForVendor];
    NSString *uuid = [vendorIdObject UUIDString];
    NSDictionary *user = @{@"app_id":uuid, @"email":email, @"password":password, @"password_confirmation":passwordConfirmation, @"username":username, @"character":character};
    NSDictionary *pet = @{@"name":name};
    NSDictionary *auth = @{@"user":user, @"pet":pet};

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading";

    NSMutableURLRequest *request = [[RKObjectManager sharedManager] requestWithObject:nil method:RKRequestMethodPOST path:@"account/create" parameters:auth];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ User.userResponseDescriptor, Pet.responseDescriptor, Success.responseDescriptor, Error.responseDescriptor ]];
    
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"keychainID" accessGroup:nil];
        [keychain setObject:email forKey:(__bridge id)(kSecAttrAccount)];
        [keychain setObject:password forKey:(__bridge id)(kSecValueData)];
        
        User *user = [mappingResult.dictionary objectForKey:@"user"];
        [self.myPetViewController loadUser:user andPets:user.userPets];
        
        [hud hide:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [hud hide:YES];
        NSLog(@"error!");
        NSString *reason = ((Error *)[[error.userInfo objectForKey:RKObjectMapperErrorObjectsKey] firstObject]).reason;
        NSLog(@"%@", reason);
        [self authNotVerified:reason];
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

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x, self.originalCenter.y - 100);
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
        [self submitAction:textField];
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
