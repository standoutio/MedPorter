//
//  CurrentMedicationsUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "CurrentMedicationsUITableViewCell.h"
#import "Constants.h"

@implementation CurrentMedicationsUITableViewCell

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
    
    [_txtMonth setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtYear setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtDueDateMonth setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtDueDateDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtDueDateYear setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtMonth setText:[[NSUserDefaults standardUserDefaults] valueForKey:kChildMonth]];
    [_txtDay setText:[[NSUserDefaults standardUserDefaults] valueForKey:kChildDay]];
    [_txtYear setText:[[NSUserDefaults standardUserDefaults] valueForKey:kChildYear]];
    [_txtDueDateMonth setText:[[NSUserDefaults standardUserDefaults] valueForKey:kDueDateMonth]];
    [_txtDueDateDay setText:[[NSUserDefaults standardUserDefaults] valueForKey:kDueDateDay]];
    [_txtDueDateYear setText:[[NSUserDefaults standardUserDefaults] valueForKey:kDueDateYear]];
    
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
        [_lblPlus setTextColor:[UIColor colorWithRed:211.0/255.0 green:84.0/255.0 blue:0.0 alpha:1.0f]];
        [_lblTitle setTextColor:[UIColor colorWithRed:211.0/255.0 green:84.0/255.0 blue:0.0 alpha:1.0f]];
        
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
    return 170.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
    
    [_txtMonth setUserInteractionEnabled:enabled];
    [_txtMonth setHidden:!enabled];
    
    [_txtDay setUserInteractionEnabled:enabled];
    [_txtDay setHidden:!enabled];
    
    [_txtYear setUserInteractionEnabled:enabled];
    [_txtYear setHidden:!enabled];
    
    [_txtDueDateMonth setUserInteractionEnabled:enabled];
    [_txtDueDateMonth setHidden:!enabled];
    
    [_txtDueDateDay setUserInteractionEnabled:enabled];
    [_txtDueDateDay setHidden:!enabled];
    
    [_txtDueDateYear setUserInteractionEnabled:enabled];
    [_txtDueDateYear setHidden:!enabled];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtMonth) {
        [_txtDay becomeFirstResponder];
    } else if (textField == _txtDay) {
        [_txtYear becomeFirstResponder];
    } else if (textField == _txtYear) {
        [_txtDueDateMonth becomeFirstResponder];
    } else if (textField == _txtDueDateMonth) {
        [_txtDueDateDay becomeFirstResponder];
    } else if (textField == _txtDueDateDay) {
        [_txtDueDateYear becomeFirstResponder];
    }
    [[NSUserDefaults standardUserDefaults] setValue:_txtMonth.text forKey:kChildMonth];
    [[NSUserDefaults standardUserDefaults] setValue:_txtDay.text forKey:kChildDay];
    [[NSUserDefaults standardUserDefaults] setValue:_txtYear.text forKey:kChildYear];
    [[NSUserDefaults standardUserDefaults] setValue:_txtDueDateMonth.text forKey:kDueDateMonth];
    [[NSUserDefaults standardUserDefaults] setValue:_txtDueDateDay.text forKey:kDueDateDay];
    [[NSUserDefaults standardUserDefaults] setValue:_txtDueDateYear.text forKey:kDueDateYear];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

- (void)checkForFinish {
    
}

@end
