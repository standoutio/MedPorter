//
//  AppDelegate.h
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LoginViewController.h"
#import "WelcomeViewController.h"
#import "MedPorterProfileViewController.h"
#import "ProfileViewController.h"
#import "MedicalProfileViewController.h"
#import "MedsProfileViewController.h"
#import "SocialProfileViewController.h"
#import "WellnessProfileViewController.h"

@interface MedPorterAppDelegate : UIResponder <UIApplicationDelegate, LoginViewControllerDelegate, WelcomeViewControllerDelegate, MedPorterProfileViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
