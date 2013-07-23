//
//  NavigationViewController.m
//  PH-Log
//
//  Created by dev on 7/1/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "NavigationViewController.h"
#import "REMenuItem.h"
#import "FAImageView.h"
#import "UIFont+FontAwesome.h"
#import "ProfileViewController.h"
#import "MedicalProfileViewController.h"
#import "MedsProfileViewController.h"
#import "SocialProfileViewController.h"
#import "WellnessProfileViewController.h"
#import "LoginViewController.h"
#import "MedPorterAppDelegate.h"

@interface NavigationViewController()

@property (strong, nonatomic) UILabel *arrowLabel;

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _arrowLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 32, self.navigationBar.frame.size.width, 12)];
    [_arrowLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:20.0f]];
    [_arrowLabel setBackgroundColor:[UIColor clearColor]];
    [_arrowLabel setTextColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1]];
    
    [_arrowLabel setTextAlignment:NSTextAlignmentCenter];
    
    [_arrowLabel setText:[NSString fontAwesomeIconStringForIconIdentifier:@"icon-angle-down"]];
    //arrowLabel.center = CGPointMake(_label.center.x, _label.center.y+15);//+_label.frame.size.height);
    
    [self.navigationBar addSubview:_arrowLabel];
    [self.navigationBar bringSubviewToFront:_arrowLabel];
    
    //self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    
    // Blocks maintain strong references to any captured objects, including self,
    // which means that it’s easy to end up with a strong reference cycle if, for example,
    // an object maintains a copy property for a block that captures self
    // (which is the case for REMenu action blocks).
    //
    // To avoid this problem, it’s best practice to capture a weak reference to self:
    //
    __typeof (&*self) __weak weakSelf = self;
    
    FAImageView *imgBasics = [[FAImageView alloc] init];
    imgBasics.image = nil;
    [imgBasics setDefaultIconIdentifier:@"icon-user"];
    REMenuItem *basics = [[REMenuItem alloc] initWithTitle:@"basics"
                                                       image:imgBasics.image
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          ProfileViewController *controller = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
                                                          controller.delegate = (MedPorterAppDelegate *)[[UIApplication sharedApplication] delegate];
                                                          [weakSelf setViewControllers:@[controller] animated:NO];
                                                      }];
    
    FAImageView *imgMedical = [[FAImageView alloc] init];
    imgMedical.image = nil;
    [imgMedical setDefaultIconIdentifier:@"icon-plus-sign-alt"];
    REMenuItem *medical = [[REMenuItem alloc] initWithTitle:@"medical"
                                                          image:imgMedical.image
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             MedicalProfileViewController *controller = [[MedicalProfileViewController alloc] init];
                                                             controller.delegate = (MedPorterAppDelegate *)[[UIApplication sharedApplication] delegate];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    FAImageView *imgMeds = [[FAImageView alloc] init];
    imgMeds.image = nil;
    [imgMeds setDefaultIconIdentifier:@"icon-medkit"];
    REMenuItem *meds = [[REMenuItem alloc] initWithTitle:@"meds"
                                                           image:imgMeds.image
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              MedsProfileViewController *controller = [[MedsProfileViewController alloc] init];
                                                              controller.delegate = (MedPorterAppDelegate *)[[UIApplication sharedApplication] delegate];
                                                              [weakSelf setViewControllers:@[controller] animated:NO];
                                                          }];
    
    FAImageView *imgSocial = [[FAImageView alloc] init];
    imgSocial.image = nil;
    [imgSocial setDefaultIconIdentifier:@"icon-group"];
    REMenuItem *social = [[REMenuItem alloc] initWithTitle:@"social"
                                                          image:imgSocial.image
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             SocialProfileViewController *controller = [[SocialProfileViewController alloc] init];
                                                             controller.delegate = (MedPorterAppDelegate *)[[UIApplication sharedApplication] delegate];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    FAImageView *imgWellness = [[FAImageView alloc] init];
    imgWellness.image = nil;
    [imgWellness setDefaultIconIdentifier:@"icon-bar-chart"];
    REMenuItem *wellness = [[REMenuItem alloc] initWithTitle:@"wellness"
                                                          image:imgWellness.image
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             WellnessProfileViewController *controller = [[WellnessProfileViewController alloc] init];
                                                             controller.delegate = (MedPorterAppDelegate *)[[UIApplication sharedApplication] delegate];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    REMenuItem *logout = [[REMenuItem alloc] initWithTitle:@"logout"
                                                          image:[UIImage imageNamed:@"survey-icon"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             LoginViewController *controller = [[LoginViewController alloc] init];
                                                             controller.delegate = (MedPorterAppDelegate *)[[UIApplication sharedApplication] delegate];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    // You can also assign custom view for items
    // Uncomment the code below and add customViewItem to `initWithItems` array, e.g.
    // [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem, customViewItem]]
    //
    /*
     UIView *customView = [[UIView alloc] init];
     customView.backgroundColor = [UIColor blueColor];
     customView.alpha = 0.4;
     REMenuItem *customViewItem = [[REMenuItem alloc] initWithCustomView:customView action:^(REMenuItem *item) {
     NSLog(@"Tap on customView");
     }];
     */
    
    basics.tag = 0;
    medical.tag = 1;
    meds.tag = 2;
    social.tag = 3;
    wellness.tag = 4;
    logout.tag = 5;
    
    _menu = [[REMenu alloc] initWithItems:@[basics, medical, meds, social, wellness, logout]];
    _menu.bounce = YES;
    _menu.cornerRadius = 4;
    _menu.shadowRadius = 4;
    _menu.shadowColor = [UIColor blackColor];
    _menu.shadowOffset = CGSizeMake(0, 1);
    _menu.shadowOpacity = 1;
    _menu.imageOffset = CGSizeMake(5, -1);
    _menu.waitUntilAnimationIsComplete = NO;
    _menu.font = [UIFont fontWithName:@"Raleway" size:20.0f];
}

- (void)hideArrowLabel {
    [_arrowLabel setHidden:YES];
}

- (void)showArrowLabel {
    [_arrowLabel setHidden:NO];
}

- (void)toggleMenu {
    if (_menu.isOpen)
        return [_menu close];
    
    [_menu showFromNavigationController:self];
}

@end
