//
//  AllergiesUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "AllergiesUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"

@implementation AllergiesUITableViewCell

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

- (IBAction)clickedSwitch:(id)sender {
    [sender toggleOn];
    [[NSUserDefaults standardUserDefaults] setBool:_switchPregnancy.isOn forKey:kBOOLAddressDuringPregnancy];
}

- (void)updateCellWithTitle:(NSString *)title {
    [_switchPregnancy initSwitch];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAddressDuringPregnancy]) {
        [_switchPregnancy toggleOn];
    }
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    [_txtAddress setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtCity setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtState setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtZip setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtAddress setText:[[NSUserDefaults standardUserDefaults] valueForKey:kAddress]];
    [_txtCity setText:[[NSUserDefaults standardUserDefaults] valueForKey:kCity]];
    [_txtState setText:[[NSUserDefaults standardUserDefaults] valueForKey:kState]];
    [_txtZip setText:[[NSUserDefaults standardUserDefaults] valueForKey:kZip]];
    
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
    return 220.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtAddress setUserInteractionEnabled:enabled];
    [_txtAddress setHidden:!enabled];
    
    [_txtCity setUserInteractionEnabled:enabled];
    [_txtCity setHidden:!enabled];
    
    [_txtState setUserInteractionEnabled:enabled];
    [_txtState setHidden:!enabled];
    
    [_txtZip setUserInteractionEnabled:enabled];
    [_txtZip setHidden:!enabled];
    
    [_switchPregnancy setUserInteractionEnabled:enabled];
    [_switchPregnancy setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtAddress) {
        [_txtCity becomeFirstResponder];
    } else if (textField == _txtCity) {
        [_txtState becomeFirstResponder];
    } else if (textField == _txtState) {
        [_txtZip becomeFirstResponder];
    }
    [[NSUserDefaults standardUserDefaults] setValue:_txtAddress.text forKey:kAddress];
    [[NSUserDefaults standardUserDefaults] setValue:_txtCity.text forKey:kCity];
    [[NSUserDefaults standardUserDefaults] setValue:_txtState.text forKey:kState];
    [[NSUserDefaults standardUserDefaults] setValue:_txtZip.text forKey:kZip];
    return YES;
}

- (void)checkForFinish {
    
}

@end
