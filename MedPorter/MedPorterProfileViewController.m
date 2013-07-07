//
//  MedPorterProfileViewController.m
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "MedPorterProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIFont+FontAwesome.h"
#import "NSString+FontAwesome.h"
#import "SIAlertView.h"

@interface MedPorterProfileViewController ()

@end

@implementation MedPorterProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    for (UILabel *l in _smallLabels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:12.0f]];
    }
    
    [_btnBasics.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:30.0f]];
    [_btnBasics setTitle:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-user"] forState:UIControlStateNormal];
    _btnBasics.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnBasics.layer.borderWidth = 1;
    
    [_btnMedical.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:30.0f]];
    [_btnMedical setTitle:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-plus-sign-alt"] forState:UIControlStateNormal];
    _btnMedical.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnMedical.layer.borderWidth = 1;
    
    [_btnMeds.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:30.0f]];
    [_btnMeds setTitle:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-medkit"] forState:UIControlStateNormal];
    _btnMeds.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnMeds.layer.borderWidth = 1;
    
    [_btnSocial.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:30.0f]];
    [_btnSocial setTitle:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-group"] forState:UIControlStateNormal];
    _btnSocial.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnSocial.layer.borderWidth = 1;
    
    [_btnWellness.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:30.0f]];
    [_btnWellness setTitle:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-bar-chart"] forState:UIControlStateNormal];
    _btnWellness.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnWellness.layer.borderWidth = 1;
    
    [_btnMenu.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:24.0f]];
    [_btnMenu setTitle:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-ellipsis-vertical"] forState:UIControlStateNormal];
    
    [_btnShare.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:30.0f]];
    [_btnShare setTitle:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-envelope-alt"] forState:UIControlStateNormal];
    
    [_btnEditName.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:30.0f]];
    [_btnEditName setTitle:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-edit"] forState:UIControlStateNormal];
    
    [_txtName setFont:[UIFont fontWithName:@"Raleway" size:18.0f]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showProfile:(id)sender {
    [_delegate showProfileViewController];
}

- (IBAction)showMedicalProfile:(id)sender {
    [_delegate showMedicalProfileViewController];
}

- (IBAction)showMedsProfile:(id)sender {
    [_delegate showMedsProfileViewController];
}

- (IBAction)showSocialProfile:(id)sender {
    [_delegate showSocialProfileViewController];
}

- (IBAction)showWellnessProfile:(id)sender {
    [_delegate showWellnessProfileViewController];
}

- (IBAction)showMenu:(id)sender {
    NSLog(@"showing menu");
}

- (IBAction)share:(id)sender {
    SIAlertView *siav = [[SIAlertView alloc] initWithTitle:@"Share" andMessage:@"You must complete all sections in order to share your profile"];
    [siav addButtonWithTitle:@"OK" type:SIAlertViewButtonTypeDestructive handler:nil];
    [siav setTransitionStyle:SIAlertViewTransitionStyleDropDown];
    [siav show];
}

- (IBAction)editName:(id)sender {
    [_txtName setUserInteractionEnabled:YES];
    [_txtName becomeFirstResponder];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [_txtName setUserInteractionEnabled:NO];
    return YES;
}

@end
