//
//  SleepUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "ToggleButton.h"

@interface SleepUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate, ToggleButtonDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *smallLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@property (weak, nonatomic) IBOutlet UIButton *switchPrednisone;
@property (weak, nonatomic) IBOutlet ToggleButton *btnSkin;
@property (weak, nonatomic) IBOutlet ToggleButton *btnLips;
@property (weak, nonatomic) IBOutlet ToggleButton *btnGenitals;
@property (weak, nonatomic) IBOutlet ToggleButton *btnEye;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedSwitch:(id)sender;

@end
