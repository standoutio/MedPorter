//
//  ActivityUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "ToggleButton.h"

@interface ActivityUITableViewCell : UITableViewCell<CustomUITableViewCell, ToggleButtonDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIButton *switchPHACE;
@property (weak, nonatomic) IBOutlet ToggleButton *btnUnknown;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedPHACESwitch:(id)sender;

@end
