//
//  AlcoholDrugUseUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "AlcoholDrugUseUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"

@implementation AlcoholDrugUseUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    [_txtDrugName setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_switchOther initSwitch];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLOtherTreatments]) {
        [_switchOther toggleOn];
    }
    
    [_lblOtherDrugs setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    [_lblOtherDrugs setText:[[NSUserDefaults standardUserDefaults] valueForKey:kOtherTreatments]];
    
    [_lblPlus setFont:[UIFont fontWithName:@"Raleway" size:26.0f]];
    
    [_lblTitle setFont:[UIFont fontWithName:@"Raleway" size:18.0f]];
    [_lblTitle setText:title];
}

- (void)cover:(AnimationBlock)block {
    [UIView animateWithDuration:0.2 animations:^{
        [self enableTextFields:NO];
        
        CGRect frame = _background.frame;
        frame.origin.x = 0;
        [_background setFrame:frame];
    } completion:^(BOOL finished) {
        [_lblPlus setText:@"+"];
        [_lblPlus setTextColor:[UIColor whiteColor]];
        [_lblTitle setTextColor:[UIColor whiteColor]];
        if (block != nil) {
            block(finished);
        }
    }];
}

- (void)uncover:(AnimationBlock)block {
    [self enableTextFields:YES];
    
    [UIView animateWithDuration:0.2 animations:^{
        [_lblPlus setText:@"-"];
        [_lblPlus setTextColor:[UIColor colorWithRed:231.0/255.0 green:76.0/255.0 blue:60.0/255.0 alpha:1.0f]];
        [_lblTitle setTextColor:[UIColor colorWithRed:231.0/255.0 green:76.0/255.0 blue:60.0/255.0 alpha:1.0f]];
        
        CGRect frame = _background.frame;
        frame.origin.x = self.frame.size.width;
        [_background setFrame:frame];
    } completion:^(BOOL finished) {
        if (block != nil) {
            block(finished);
        }
    }];
}

- (IBAction)clickedSwitch:(id)sender {
    [sender toggleOn];
    if (!_switchOther.isOn) {
        [_lblOtherDrugs setText:@""];
        [[NSUserDefaults standardUserDefaults] setValue:_lblOtherDrugs.text forKey:kOtherTreatments];
    }
    [[NSUserDefaults standardUserDefaults] setBool:_switchOther.isOn forKey:kBOOLOtherTreatments];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (float)expandedHeight {
    return 240.0f;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (_txtDrugName.text.length != 0) {
        if (_lblOtherDrugs.text.length == 0) {
            [_lblOtherDrugs setText:_txtDrugName.text];
        } else {
            [_lblOtherDrugs setText:[NSString stringWithFormat:@"%@, %@",_lblOtherDrugs.text, _txtDrugName.text]];
        }
        [[NSUserDefaults standardUserDefaults] setValue:_lblOtherDrugs.text forKey:kOtherTreatments];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [_txtDrugName setText:@""];
    }
    return YES;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtDrugName setUserInteractionEnabled:enabled];
    [_txtDrugName setHidden:!enabled];
    
    [_switchOther setUserInteractionEnabled:enabled];
    [_switchOther setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    
}

@end
