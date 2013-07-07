//
//  WomensHealthUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "ToggleButton.h"

@interface WomensHealthUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate, ToggleButtonDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *smallLabels;
@property (strong, nonatomic) IBOutletCollection(ToggleButton) NSArray *radioButtons;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UITextField *txtOtherVisual;
@property (weak, nonatomic) IBOutlet UITextField *txtOtherAirway;
@property (weak, nonatomic) IBOutlet UIButton *switchComplications;
@property (weak, nonatomic) IBOutlet UIButton *switchUlceration;
@property (weak, nonatomic) IBOutlet UIButton *switchBleeding;
@property (weak, nonatomic) IBOutlet UIButton *switchAuditoryCanal;
@property (weak, nonatomic) IBOutlet UIButton *switchPain;
@property (weak, nonatomic) IBOutlet UIButton *switchVisualCompromise;
@property (weak, nonatomic) IBOutlet UIButton *switchAirwayObstruction;
@property (weak, nonatomic) IBOutlet ToggleButton *btnComplicationsUnknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnUlcerationUnknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnBleedingUnknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnAuditoryCanalUnknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnPainUnknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnVisualCompromiseUnknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnObstructionOfVisualAxis;
@property (weak, nonatomic) IBOutlet ToggleButton *btnRefractoryError;
@property (weak, nonatomic) IBOutlet ToggleButton *btnTearDuctObstruction;
@property (weak, nonatomic) IBOutlet ToggleButton *btnAmblyopia;
@property (weak, nonatomic) IBOutlet ToggleButton *btnRetrobulbarInvolvement;
@property (weak, nonatomic) IBOutlet ToggleButton *btnVisualCompromiseUnknownUnknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnVisualCompromiseOther;
@property (weak, nonatomic) IBOutlet ToggleButton *btnAirwayObstructionUknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnAirwayHemangioma;
@property (weak, nonatomic) IBOutlet ToggleButton *btnNasalObstruction;
@property (weak, nonatomic) IBOutlet ToggleButton *btnExternalAirwayCompression;
@property (weak, nonatomic) IBOutlet ToggleButton *btnAirwayObstructionUnknownUnknown;
@property (weak, nonatomic) IBOutlet ToggleButton *btnAirwayObstructionOther;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedSwitch:(id)sender;

@end
