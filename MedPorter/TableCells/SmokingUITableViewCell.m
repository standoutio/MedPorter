//
//  SmokingUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "SmokingUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"

@implementation SmokingUITableViewCell

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
    
    [_switchSmoke initSwitch];
    [_switchSecondHand initSwitch];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLSmokedDuringPregnancy]) {
        [_switchSmoke toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLSecondHandSmokeDuringPregnancy]) {
        [_switchSecondHand toggleOn];
    }
    
    [_txtPacksPerDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtPacksPerDay setText:[[NSUserDefaults standardUserDefaults] valueForKey:kPacksPerDay]];
    
    [_sliderSmoke setValue:[[NSUserDefaults standardUserDefaults] floatForKey:kSmokedDuringPregnancyTrimester]];
    [_sliderSecondHand setValue:[[NSUserDefaults standardUserDefaults] floatForKey:kSecondHandSmokeDuringPregnancyTrimester]];
    
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

- (IBAction)clickedSmokeSwitch:(id)sender {
    [sender toggleOn];
    [[NSUserDefaults standardUserDefaults] setBool:_switchSmoke.isOn forKey:kBOOLSmokedDuringPregnancy];
}

- (IBAction)clickedSecondHandSwitch:(id)sender {
    [sender toggleOn];
    [[NSUserDefaults standardUserDefaults] setBool:_switchSecondHand.isOn forKey:kBOOLSecondHandSmokeDuringPregnancy];
}

- (IBAction)sliderValueChanged:(id)sender {
    if (sender == _sliderSmoke) {
        [[NSUserDefaults standardUserDefaults] setFloat:(int)_sliderSmoke.value forKey:kSmokedDuringPregnancyTrimester];
    } else if (sender == _sliderSecondHand) {
        [[NSUserDefaults standardUserDefaults] setFloat:(int)_sliderSecondHand.value forKey:kSecondHandSmokeDuringPregnancyTrimester];
    }
}

- (float)expandedHeight {
    return 425.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtPacksPerDay setUserInteractionEnabled:enabled];
    [_txtPacksPerDay setHidden:!enabled];
    
    [_sliderSmoke setUserInteractionEnabled:enabled];
    [_sliderSmoke setHidden:!enabled];
    
    [_sliderSecondHand setUserInteractionEnabled:enabled];
    [_sliderSecondHand setHidden:!enabled];
    
    [_switchSmoke setUserInteractionEnabled:enabled];
    [_switchSmoke setHidden:!enabled];
    
    [_switchSecondHand setUserInteractionEnabled:enabled];
    [_switchSecondHand setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setValue:_txtPacksPerDay.text forKey:kPacksPerDay];
    return YES;
}

- (void)checkForFinish {
    
}

@end
