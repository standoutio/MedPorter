//
//  SleepUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "SleepUITableViewCell.h"
#import "UIButton+Switch.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@implementation SleepUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initToggleButtons {
    _btnSkin.layer.cornerRadius = 5;
    _btnSkin.selectedImageName = @"check-white";
    _btnSkin.imageName = @"";
    _btnSkin.delegate = self;
    
    _btnLips.layer.cornerRadius = 5;
    _btnLips.selectedImageName = @"check-white";
    _btnLips.imageName = @"";
    _btnLips.delegate = self;;
    
    _btnGenitals.layer.cornerRadius = 5;
    _btnGenitals.selectedImageName = @"check-white";
    _btnGenitals.imageName = @"";
    _btnGenitals.delegate = self;
    
    _btnEye.layer.cornerRadius = 5;
    _btnEye.selectedImageName = @"check-white";
    _btnEye.imageName = @"";
    _btnEye.delegate = self;
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
    
    for (UILabel *l in _smallLabels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    [_switchPrednisone initSwitch];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPrednisone]) {
        [_switchPrednisone toggleOn];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPrednisoneAppliedToEye]) {
        [_btnEye turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPrednisoneAppliedToGenitalRegion]) {
        [_btnGenitals turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPrednisoneAppliedToLips]) {
        [_btnLips turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPrednisoneAppliedToSkin]) {
        [_btnSkin turnOn];
    }
    
    [_txtAge setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtAge setText:[[NSUserDefaults standardUserDefaults] valueForKey:kPrednisoneStarted]];
    
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
        [_lblPlus setTextColor:[UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1.0f]];
        [_lblTitle setTextColor:[UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1.0f]];
        
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
    [[NSUserDefaults standardUserDefaults] setBool:_switchPrednisone.isOn forKey:kBOOLPrednisone];
}

- (float)expandedHeight {
    return 250.0f;
}

- (void)toggleButtonDidChange:(ToggleButton *)btn {
    if (btn == _btnEye) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnEye.isSelected forKey:kBOOLPrednisoneAppliedToEye];
    } else if (btn == _btnGenitals) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnGenitals.isSelected forKey:kBOOLPrednisoneAppliedToGenitalRegion];
    } else if (btn == _btnLips) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnLips.isSelected forKey:kBOOLPrednisoneAppliedToLips];
    } else if (btn == _btnSkin) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnSkin.isSelected forKey:kBOOLPrednisoneAppliedToSkin];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setValue:_txtAge.text forKey:kPrednisoneStarted];
    return YES;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtAge setUserInteractionEnabled:enabled];
    [_txtAge setHidden:!enabled];
    
    [_switchPrednisone setUserInteractionEnabled:enabled];
    [_switchPrednisone setHidden:!enabled];
    
    [_btnSkin setUserInteractionEnabled:enabled];
    [_btnSkin setHidden:!enabled];
    
    [_btnLips setUserInteractionEnabled:enabled];
    [_btnLips setHidden:!enabled];
    
    [_btnGenitals setUserInteractionEnabled:enabled];
    [_btnGenitals setHidden:!enabled];
    
    [_btnEye setUserInteractionEnabled:enabled];
    [_btnEye setHidden:!enabled];
    
    for (UILabel *l in _smallLabels) {
        [l setHidden:!enabled];
    }
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    
}

@end
