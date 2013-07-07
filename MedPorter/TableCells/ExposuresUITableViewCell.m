//
//  ExposuresUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "ExposuresUITableViewCell.h"
#import "Constants.h"

@implementation ExposuresUITableViewCell

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
    [_txtMotherMonth setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtMotherDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtMotherYear setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtFatherMonth setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtFatherDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtFatherYear setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtMotherMonth setText:[[NSUserDefaults standardUserDefaults] valueForKey:kMotherMonth]];
    [_txtMotherDay setText:[[NSUserDefaults standardUserDefaults] valueForKey:kMotherDay]];
    [_txtMotherYear setText:[[NSUserDefaults standardUserDefaults] valueForKey:kMotherYear]];
    [_txtFatherMonth setText:[[NSUserDefaults standardUserDefaults] valueForKey:kFatherMonth]];
    [_txtFatherDay setText:[[NSUserDefaults standardUserDefaults] valueForKey:kFatherDay]];
    [_txtFatherYear setText:[[NSUserDefaults standardUserDefaults] valueForKey:kFatherYear]];
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    
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

- (float)expandedHeight {
    return 200.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtMotherMonth setUserInteractionEnabled:enabled];
    [_txtMotherMonth setHidden:!enabled];
    
    [_txtMotherDay setUserInteractionEnabled:enabled];
    [_txtMotherDay setHidden:!enabled];
    
    [_txtMotherYear setUserInteractionEnabled:enabled];
    [_txtMotherYear setHidden:!enabled];
    
    [_txtFatherMonth setUserInteractionEnabled:enabled];
    [_txtFatherMonth setHidden:!enabled];
    
    [_txtFatherDay setUserInteractionEnabled:enabled];
    [_txtFatherDay setHidden:!enabled];
    
    [_txtFatherYear setUserInteractionEnabled:enabled];
    [_txtFatherYear setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtMotherMonth) {
        [_txtMotherDay becomeFirstResponder];
    } else if (textField == _txtMotherDay) {
        [_txtMotherYear becomeFirstResponder];
    } else if (textField == _txtMotherYear) {
        [_txtFatherMonth becomeFirstResponder];
    } else if (textField == _txtFatherMonth) {
        [_txtFatherDay becomeFirstResponder];
    } else if (textField == _txtFatherDay) {
        [_txtFatherYear becomeFirstResponder];
    }
    [[NSUserDefaults standardUserDefaults] setValue:_txtMotherMonth.text forKey:kMotherMonth];
    [[NSUserDefaults standardUserDefaults] setValue:_txtMotherDay.text forKey:kMotherDay];
    [[NSUserDefaults standardUserDefaults] setValue:_txtMotherYear.text forKey:kMotherYear];
    [[NSUserDefaults standardUserDefaults] setValue:_txtFatherMonth.text forKey:kFatherMonth];
    [[NSUserDefaults standardUserDefaults] setValue:_txtFatherDay.text forKey:kFatherDay];
    [[NSUserDefaults standardUserDefaults] setValue:_txtFatherYear.text forKey:kFatherYear];
    return YES;
}

- (void)checkForFinish {
    
}

@end
