//
//  WelcomeViewController.h
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WelcomeViewControllerDelegate;

@interface WelcomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
- (IBAction)dismissWelcomeScreen:(id)sender;
@property (strong, nonatomic) id<WelcomeViewControllerDelegate> delegate;
@end

@protocol WelcomeViewControllerDelegate <NSObject>

- (void)dismissWelcomeScreen;

@end