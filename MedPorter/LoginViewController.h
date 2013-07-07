//
//  ViewController.h
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashedBorderUITextField.h"

@protocol LoginViewControllerDelegate;

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSecondaryTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
@property (weak, nonatomic) IBOutlet UILabel *lblPassword;
@property (weak, nonatomic) IBOutlet DashedBorderUITextField *txtUsername;
@property (weak, nonatomic) IBOutlet DashedBorderUITextField *txtPassword;
@property (strong, nonatomic) id<LoginViewControllerDelegate> delegate;
- (IBAction)registerUser:(id)sender;
- (IBAction)loginUser:(id)sender;
@end

@protocol LoginViewControllerDelegate <NSObject>

- (void)userDidLogin;
- (void)userDidRegister;

@end