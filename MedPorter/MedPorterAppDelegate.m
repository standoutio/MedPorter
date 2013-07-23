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
#import "NavigationViewController.h"

@interface MedPorterAppDelegate()

@property (strong, nonatomic) NavigationViewController *controller;
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
    
    [Catalyze setApplicationKey:kCatalyzeAppKey];
    
    if (![[CatalyzePerson currentPerson] isAuthenticated]) {
        _profile = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
        _profile.delegate = self;
        _controller = [[NavigationViewController alloc] initWithRootViewController:_profile];
    } else {
        _controller = [[NavigationViewController alloc] initWithRootViewController:_login];
    }
    
    [_controller.navigationBar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:_controller action:@selector(toggleMenu)]];
    //_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    self.window.rootViewController = _controller;
    [self.window makeKeyAndVisible];
    
    CGSize size = CGSizeMake(self.window.frame.size.width, 44);
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    //Build a rect of appropriate size at origin 0,0
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);
    
    //Set the fill color
    CGContextSetFillColorWithColor(currentContext, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor);
    
    //Fill the color
    CGContextFillRect(currentContext, fillRect);
    
    //Snap the picture and close the context
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          [UIFont fontWithName:@"Raleway" size:20.0f], UITextAttributeFont,
                                                          [UIColor clearColor], UITextAttributeTextShadowColor,
                                                          nil]];
    
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
    _login.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [UIView animateWithDuration:0.5 animations:^{
        //[UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_login animated:YES];
        //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
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
    _welcome.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [UIView animateWithDuration:0.5 animations:^{
        //[UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_welcome animated:YES];
        //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

#pragma mark - MedPorterProfileViewControllerDelegate

- (void)showProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _profile = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
    _profile.delegate = self;
    _profile.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [UIView animateWithDuration:0.5 animations:^{
        //[UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_profile animated:YES];
        //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showMedicalProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _medical = [[MedicalProfileViewController alloc] initWithNibName:nil bundle:nil];
    _medical.delegate = self;
    _medical.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [UIView animateWithDuration:0.5 animations:^{
        //[UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_medical animated:YES];
        //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showMedsProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _meds = [[MedsProfileViewController alloc] initWithNibName:nil bundle:nil];
    _meds.delegate = self;
    _meds.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [UIView animateWithDuration:0.5 animations:^{
        //[UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_meds animated:YES];
        //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showSocialProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _social = [[SocialProfileViewController alloc] initWithNibName:nil bundle:nil];
    _social.delegate = self;
    _social.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [UIView animateWithDuration:0.5 animations:^{
        //[UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_social animated:YES];
        //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showWellnessProfileViewController {
    [_controller popViewControllerAnimated:NO];
    _wellness = [[WellnessProfileViewController alloc] initWithNibName:nil bundle:nil];
    _wellness.delegate = self;
    _wellness.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [UIView animateWithDuration:0.5 animations:^{
        //[UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_wellness animated:YES];
        //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

@end
