//
//  SurgeriesUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "ToggleButton.h"

@interface SurgeriesUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate, ToggleButtonDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *smallLabels;
@property (strong, nonatomic) IBOutletCollection(ToggleButton) NSArray *toggleButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *switches;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UITextField *txtComments;
@property (weak, nonatomic) IBOutlet UIButton *switchCongenitalHeartDisease;
@property (weak, nonatomic) IBOutlet UIButton *switchAbnormalitiesOfAorta;
@property (weak, nonatomic) IBOutlet UIButton *switchAbnormalitiesOfBloodVessels;
@property (weak, nonatomic) IBOutlet UIButton *switchSeizures;
@property (weak, nonatomic) IBOutlet UIButton *switchDevelopmentalDelay;
@property (weak, nonatomic) IBOutlet UIButton *switchHypertension;
@property (weak, nonatomic) IBOutlet UIButton *switchStroke;
@property (weak, nonatomic) IBOutlet UIButton *switchMigraine;
@property (weak, nonatomic) IBOutlet UIButton *switchOcularAbnormalities;
@property (weak, nonatomic) IBOutlet UIButton *switchEndocrineAbnormalities;
@property (weak, nonatomic) IBOutlet UIButton *switchMastocytosis;
@property (weak, nonatomic) IBOutlet ToggleButton *btnCongenitalHeartDisease;
@property (weak, nonatomic) IBOutlet ToggleButton *btnAbnormalitiesOfAorta;
@property (weak, nonatomic) IBOutlet ToggleButton *btnAbnormalitiesOfBloodVessels;
@property (weak, nonatomic) IBOutlet ToggleButton *btnSeizures;
@property (weak, nonatomic) IBOutlet ToggleButton *btnDevelopmentalDelay;
@property (weak, nonatomic) IBOutlet ToggleButton *btnHypertension;
@property (weak, nonatomic) IBOutlet ToggleButton *btnStroke;
@property (weak, nonatomic) IBOutlet ToggleButton *btnMigraine;
@property (weak, nonatomic) IBOutlet ToggleButton *btnOcularAbnormalities;
@property (weak, nonatomic) IBOutlet ToggleButton *btnEndocrineAbnormalities;
@property (weak, nonatomic) IBOutlet ToggleButton *btnMastocytosis;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedSwitch:(id)sender;

@end
