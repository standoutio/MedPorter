//
//  PublicSafetyUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "RadioButton.h"

@interface PublicSafetyUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *smallLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIButton *switchPropanolol;
@property (weak, nonatomic) IBOutlet UITextField *txtPounds;
@property (weak, nonatomic) IBOutlet RadioButton *btnAmount20;
@property (weak, nonatomic) IBOutlet RadioButton *btnAmount40;
@property (weak, nonatomic) IBOutlet RadioButton *btnTimes1;
@property (weak, nonatomic) IBOutlet RadioButton *btnTimes2;
@property (weak, nonatomic) IBOutlet RadioButton *btnTimes3;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@property (weak, nonatomic) IBOutlet UITextField *txtTime1;
@property (weak, nonatomic) IBOutlet UITextField *txtTime2;
@property (weak, nonatomic) IBOutlet UITextField *txtTime3;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedSwitch:(id)sender;
- (IBAction)clickedAmountButton:(id)sender;
- (IBAction)clickedMedsButton:(id)sender;

@end
