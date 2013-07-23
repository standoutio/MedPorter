//
//  FamilyConditionsUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "FamilyConditionsUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"

@implementation FamilyConditionsUITableViewCell

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
    
    for (UILabel *l in _smallLabels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    [_switchOralSteroids initSwitch];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLOralSteroids]) {
        [_switchOralSteroids toggleOn];
    }
    
    [_txtAge setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtAge setText:[[NSUserDefaults standardUserDefaults] valueForKey:kOralSteroidsStarted]];
    
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

- (IBAction)clickedSwitch:(id)sender {
    [sender toggleOn];
    [[NSUserDefaults standardUserDefaults] setBool:_switchOralSteroids.isOn forKey:kBOOLOralSteroids];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (float)expandedHeight {
    return 140.0f;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setValue:_txtAge.text forKey:kOralSteroidsStarted];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtAge setUserInteractionEnabled:enabled];
    [_txtAge setHidden:!enabled];
    
    [_switchOralSteroids setUserInteractionEnabled:enabled];
    [_switchOralSteroids setHidden:!enabled];
    
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
