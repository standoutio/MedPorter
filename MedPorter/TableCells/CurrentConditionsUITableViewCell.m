//
//  CurrentConditionUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "CurrentConditionsUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@implementation CurrentConditionsUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)initToggleButtons {
    _btnUnknown.layer.cornerRadius = 5;
    [_btnUnknown setSelectedImageName:@"check-white"];
    [_btnUnknown setImageName:@""];
    _btnUnknown.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    [self initToggleButtons];
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    
    [_txtInches setText:[[NSUserDefaults standardUserDefaults] valueForKey:kBirthHeightInches]];
    
    [_txtInches setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLBirthHeightUnknown]) {
        [_btnUnknown turnOn];
    }
    
    [_lblPlus setFont:[UIFont fontWithName:@"Raleway" size:26.0f]];
    
    [_lblTitle setFont:[UIFont fontWithName:@"Raleway" size:18.0f]];
    [_lblTitle setText:title];
}

- (void)cover:(AnimationBlock)block {
    [UIView animateWithDuration:0.2 animations:^{
        [self enableToggleButtons:NO];
        
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
    [self enableToggleButtons:YES];
    
    [UIView animateWithDuration:0.2 animations:^{
        [_lblPlus setText:@"-"];
        [_lblPlus setTextColor:[UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1.0f]];
        [_lblTitle setTextColor:[UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1.0f]];
        
        CGRect frame = _background.frame;
        frame.origin.x = self.frame.size.width;
        [_background setFrame:frame];
    } completion:^(BOOL finished) {
        if (block != nil) {
            block(finished);
        }
    }];
}

- (float)expandedHeight {
    return 130.0f;
}

- (void)toggleButtonDidChange:(ToggleButton *)btn {
    [[NSUserDefaults standardUserDefaults] setBool:_btnUnknown.isSelected forKey:kBOOLBirthHeightUnknown];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)enableToggleButtons:(BOOL)enabled {
    [_btnUnknown setUserInteractionEnabled:enabled];
    [_btnUnknown setHidden:!enabled];
    
    [_txtInches setUserInteractionEnabled:enabled];
    [_txtInches setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setValue:_txtInches.text forKey:kBirthHeightInches];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

- (void)checkForFinish {
    
}

@end
