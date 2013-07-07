//
//  AppDelegate.m
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "MedPorterAppDelegate.h"
#import "Constants.h"
#import "Catalyze.h"
#import "LoginViewController.h"

@interface MedPorterAppDelegate()

@property (strong, nonatomic) UINavigationController *controller;
@property (strong, nonatomic) LoginViewController *login;
@property (strong, nonatomic) WelcomeViewController *welcome;
@property (strong, nonatomic) ProfileViewController *profile;
@property (strong, nonatomic) MedicalProfileViewController *medical;
@property (strong, nonatomic) MedsProfileViewController *meds;
@property (strong, nonatomic) SocialProfileViewController *social;
@property (strong, nonatomic) WellnessProfileViewController *wellness;

@end

@implementation MedPorterAppDelegate
@synthesize controller = _controller;
@synthesize login = _login;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    _login = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    _login.delegate = self;
    
    [Catalyze setApplicationId:kCatalyzeAppKey];
    
    if ([[CatalyzePerson currentPerson] isAuthenticated]) {
        _profile = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
        _profile.delegate = self;
        _controller = [[UINavigationController alloc] initWithRootViewController:_profile];
    } else {
        ////////////////////
        _profile = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
        _profile.delegate = self;
        ///////////////////
        _controller = [[UINavigationController alloc] initWithRootViewController:_profile];
    }
    
    _controller.navigationBarHidden = YES;
    //_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    self.window.rootViewController = _controller;
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - LoginViewControllerDelegate

- (void)userDidLogin {
    [_controller popViewControllerAnimated:NO];
    [self showProfileViewController];
}

- (void)userDidRegister {
    [_controller popViewControllerAnimated:NO];
    [self showWelcomeViewController];
}

- (void)showLoginViewController {
    _login = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    _login.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_login animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

#pragma mark - WelcomeViewController

- (void)dismissWelcomeScreen {
    [_controller popViewControllerAnimated:NO];
    [self showProfileViewController];
}

- (void)showWelcomeViewController {
    _welcome = [[WelcomeViewController alloc] initWithNibName:nil bundle:nil];
    _welcome.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_welcome animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

#pragma mark - MedPorterProfileViewControllerDelegate

- (void)showProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _profile = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
    _profile.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_profile animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showMedicalProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _medical = [[MedicalProfileViewController alloc] initWithNibName:nil bundle:nil];
    _medical.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_medical animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showMedsProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _meds = [[MedsProfileViewController alloc] initWithNibName:nil bundle:nil];
    _meds.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_meds animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showSocialProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _social = [[SocialProfileViewController alloc] initWithNibName:nil bundle:nil];
    _social.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_social animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showWellnessProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _wellness = [[WellnessProfileViewController alloc] initWithNibName:nil bundle:nil];
    _wellness.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_wellness animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

@end
