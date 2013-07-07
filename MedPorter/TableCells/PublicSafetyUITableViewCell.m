//
//  PublicSafetyUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "PublicSafetyUITableViewCell.h"
#import "UIButton+Switch.h"
#import <QuartzCore/QuartzCore.h>
#import "RadioGroup.h"
#import "Constants.h"

@interface PublicSafetyUITableViewCell()

@property (strong, nonatomic) RadioGroup *groupAmount;
@property (strong, nonatomic) RadioGroup *groupGiveMeds;

@end

@implementation PublicSafetyUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initToggleButtons {
    _btnAmount20.layer.cornerRadius = 5;
    _btnAmount20.selectedImageName = @"check-white";
    _btnAmount20.imageName = @"";
    
    _btnAmount40.layer.cornerRadius = 5;
    _btnAmount40.selectedImageName = @"check-white";
    _btnAmount40.imageName = @"";
    
    _btnTimes1.layer.cornerRadius = 5;
    _btnTimes1.selectedImageName = @"check-white";
    _btnTimes1.imageName = @"";
    
    _btnTimes2.layer.cornerRadius = 5;
    _btnTimes2.selectedImageName = @"check-white";
    _btnTimes2.imageName = @"";
    
    _btnTimes3.layer.cornerRadius = 5;
    _btnTimes3.selectedImageName = @"check-white";
    _btnTimes3.imageName = @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    [self initToggleButtons];
    
    if (!_groupAmount) {
        _groupAmount = [[RadioGroup alloc] init];
        [_groupAmount registerButton:_btnAmount20];
        [_groupAmount registerButton:_btnAmount40];
    }
    if (!_groupGiveMeds) {
        _groupGiveMeds = [[RadioGroup alloc] init];
        [_groupGiveMeds registerButton:_btnTimes1];
        [_groupGiveMeds registerButton:_btnTimes2];
        [_groupGiveMeds registerButton:_btnTimes3];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPropanololAmount20]) {
        [_groupAmount clickedButton:_btnAmount20];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPropanololAmount40]) {
        [_groupAmount clickedButton:_btnAmount40];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLGiveMeds1]) {
        [_groupGiveMeds clickedButton:_btnTimes1];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLGiveMeds2]) {
        [_groupGiveMeds clickedButton:_btnTimes2];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLGiveMeds3]) {
        [_groupGiveMeds clickedButton:_btnTimes3];
    }
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    
    for (UILabel *l in _smallLabels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    [_switchPropanolol initSwitch];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPropanolol]) {
        [_switchPropanolol toggleOn];
    }
    
    [_txtPounds setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtPounds setText:[[NSUserDefaults standardUserDefaults] valueForKey:kCurrentWeightOfBaby]];
    
    [_txtTime1 setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtTime2 setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtTime3 setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtTime1 setText:[[NSUserDefaults standardUserDefaults] valueForKey:kGiveMedsTime1]];
    [_txtTime2 setText:[[NSUserDefaults standardUserDefaults] valueForKey:kGiveMedsTime2]];
    [_txtTime3 setText:[[NSUserDefaults standardUserDefaults] valueForKey:kGiveMedsTime3]];
    
    [_txtAge setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtAge setText:[[NSUserDefaults standardUserDefaults] valueForKey:kPropanololStarted]];
    
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
        [_lblPlus setTextColor:[UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.0f]];
        [_lblTitle setTextColor:[UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.0f]];
        
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
    [[NSUserDefaults standardUserDefaults] setBool:_switchPropanolol.isOn forKey:kBOOLPropanolol];
}

- (IBAction)clickedAmountButton:(id)sender {
    [_groupAmount clickedButton:sender];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLPropanololAmount20];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLPropanololAmount40];
    if (sender == _btnAmount20) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLPropanololAmount20];
    } else if (sender == _btnAmount40) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLPropanololAmount40];
    }
}

- (IBAction)clickedMedsButton:(id)sender {
    [_groupGiveMeds clickedButton:sender];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLGiveMeds1];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLGiveMeds2];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLGiveMeds3];
    if (sender == _btnTimes1) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLGiveMeds1];
    } else if (sender == _btnTimes2) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLGiveMeds2];
    } else if (sender == _btnTimes3) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLGiveMeds3];
    }
}

- (float)expandedHeight {
    return 345.0f;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtAge) {
        [[NSUserDefaults standardUserDefaults] setValue:_txtAge.text forKey:kPropanololStarted];
    } else if (textField == _txtPounds) {
        [[NSUserDefaults standardUserDefaults] setValue:_txtPounds.text forKey:kCurrentWeightOfBaby];
    } else if (textField == _txtTime1) {
        [[NSUserDefaults standardUserDefaults] setValue:_txtTime1.text forKey:kGiveMedsTime1];
    } else if (textField == _txtTime2) {
        [[NSUserDefaults standardUserDefaults] setValue:_txtTime2.text forKey:kGiveMedsTime2];
    } else if (textField == _txtTime3) {
        [[NSUserDefaults standardUserDefaults] setValue:_txtTime3.text forKey:kGiveMedsTime3];
    }
    return YES;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtAge setUserInteractionEnabled:enabled];
    [_txtAge setHidden:!enabled];
    
    [_txtPounds setUserInteractionEnabled:enabled];
    [_txtPounds setHidden:!enabled];
    
    [_txtTime1 setUserInteractionEnabled:enabled];
    [_txtTime1 setHidden:!enabled];
    
    [_txtTime2 setUserInteractionEnabled:enabled];
    [_txtTime2 setHidden:!enabled];
    
    [_txtTime3 setUserInteractionEnabled:enabled];
    [_txtTime3 setHidden:!enabled];
    
    [_switchPropanolol setUserInteractionEnabled:enabled];
    [_switchPropanolol setHidden:!enabled];
    
    [_btnAmount20 setUserInteractionEnabled:enabled];
    [_btnAmount20 setHidden:!enabled];
    
    [_btnAmount40 setUserInteractionEnabled:enabled];
    [_btnAmount40 setHidden:!enabled];
    
    [_btnTimes1 setUserInteractionEnabled:enabled];
    [_btnTimes1 setHidden:!enabled];
    
    [_btnTimes2 setUserInteractionEnabled:enabled];
    [_btnTimes2 setHidden:!enabled];
    
    [_btnTimes3 setUserInteractionEnabled:enabled];
    [_btnTimes3 setHidden:!enabled];
    
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
