//
//  ViewController.m
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "LoginViewController.h"
#import "UIFont+FontAwesome.h"
#import "NSString+FontAwesome.h"
#import "Catalyze.h"
#import "SIAlertView.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_lblUsername setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:16.0f]];
    [_lblPassword setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:16.0f]];
    
    [_lblUsername setText:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-user"]];
    [_lblPassword setText:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-lock"]];
    
    [_lblTitle setFont:[UIFont fontWithName:@"Raleway" size:26.0f]];
    [_lblSecondaryTitle setFont:[UIFont fontWithName:@"Raleway-Light" size:16.0f]];
    
    [_txtUsername setFont:[UIFont fontWithName:@"Raleway-Light" size:14.0f]];
    [_txtPassword setFont:[UIFont fontWithName:@"Raleway-Light" size:14.0f]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) NSStringIsValidEmail:(NSString *)checkString {
    BOOL stricterFilter = YES; 
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (BOOL)validateInput {
    BOOL ok = YES;
    NSString *msg = @"ok";
    if (_txtPassword.text.length < 6) {
        ok = NO;
        msg = @"Your password must contain at least 6 characters";
    }
    if (_txtUsername.text.length == 0) {
        ok = NO;
        msg = @"Username is a required field";
    }
    if (![self NSStringIsValidEmail:_txtUsername.text]) {
        ok = NO;
        msg = @"Username must be a valid email";
    }
    if (!ok) {
        SIAlertView *siav = [[SIAlertView alloc] initWithTitle:@"Login Error" andMessage:msg];
        [siav setTransitionStyle:SIAlertViewTransitionStyleDropDown];
        [siav addButtonWithTitle:@"OK" type:SIAlertViewButtonTypeDestructive handler:nil];
        [siav show];
    }
    return ok;
}

- (IBAction)registerUser:(id)sender {
    if ([self validateInput]) {
        [CatalyzePerson signUpWithUsernameInBackground:_txtUsername.text password:_txtPassword.text options:nil block:^(BOOL succeeded, int status, NSError *error) {
            if (succeeded) {
                NSLog(@"successful registration");
                [_delegate userDidRegister];
            } else if (status == 400) {
                SIAlertView *siav = [[SIAlertView alloc] initWithTitle:@"Registration Error" andMessage:@"This username is already registered"];
                [siav setTransitionStyle:SIAlertViewTransitionStyleDropDown];
                [siav addButtonWithTitle:@"OK" type:SIAlertViewButtonTypeDestructive handler:nil];
                [siav show];
            } else {
                SIAlertView *siav = [[SIAlertView alloc] initWithTitle:@"Registration Error" andMessage:@"Something went wrong, try again"];
                [siav setTransitionStyle:SIAlertViewTransitionStyleDropDown];
                [siav addButtonWithTitle:@"OK" type:SIAlertViewButtonTypeDestructive handler:nil];
                [siav show];
            }
        }];
    }
}

- (IBAction)loginUser:(id)sender {
    if ([self validateInput]) {
        [CatalyzePerson logInWithUsernameInBackground:_txtUsername.text password:_txtPassword.text block:^(CatalyzeObject *object, NSError *error) {
            if (!error) {
                NSLog(@"successful login");
                [_delegate userDidLogin];
            } else {
                SIAlertView *siav = [[SIAlertView alloc] initWithTitle:@"Login Error" andMessage:@"Wrong username / password"];
                [siav setTransitionStyle:SIAlertViewTransitionStyleDropDown];
                [siav addButtonWithTitle:@"OK" type:SIAlertViewButtonTypeDestructive handler:nil];
                [siav show];
            }
        }];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtUsername) {
        [_txtPassword becomeFirstResponder];
    }
    return YES;
}

@end
