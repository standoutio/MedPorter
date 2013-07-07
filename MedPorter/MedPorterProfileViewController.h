//
//  MedPorterProfileViewController.h
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashedBorderUITextField.h"

@protocol MedPorterProfileViewControllerDelegate;

@interface MedPorterProfileViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) id<MedPorterProfileViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *smallLabels;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (weak, nonatomic) IBOutlet UIButton *btnEditName;
@property (weak, nonatomic) IBOutlet DashedBorderUITextField *txtName;
@property (weak, nonatomic) IBOutlet UITableView *tbl;
@property (weak, nonatomic) IBOutlet UIButton *btnBasics;
@property (weak, nonatomic) IBOutlet UIButton *btnMedical;
@property (weak, nonatomic) IBOutlet UIButton *btnMeds;
@property (weak, nonatomic) IBOutlet UIButton *btnSocial;
@property (weak, nonatomic) IBOutlet UIButton *btnWellness;
- (IBAction)showMenu:(id)sender;
- (IBAction)share:(id)sender;
- (IBAction)editName:(id)sender;
- (IBAction)showProfile:(id)sender;
- (IBAction)showMedicalProfile:(id)sender;
- (IBAction)showMedsProfile:(id)sender;
- (IBAction)showSocialProfile:(id)sender;
- (IBAction)showWellnessProfile:(id)sender;
@end

@protocol MedPorterProfileViewControllerDelegate <NSObject>

- (void)showProfileViewController;
- (void)showMedicalProfileViewController;
- (void)showMedsProfileViewController;
- (void)showSocialProfileViewController;
- (void)showWellnessProfileViewController;

@end
