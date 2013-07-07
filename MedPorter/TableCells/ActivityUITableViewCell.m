//
//  ActivityUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "ActivityUITableViewCell.h"
#import "UIButton+Switch.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@implementation ActivityUITableViewCell

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
    
    [_switchPHACE initSwitch];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPHACE]) {
        [_switchPHACE toggleOn];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPHACEUnknown]) {
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

- (IBAction)clickedPHACESwitch:(id)sender {
    [sender toggleOn];
    [[NSUserDefaults standardUserDefaults] setBool:_switchPHACE.isOn forKey:kBOOLPHACE];
}

- (float)expandedHeight {
    return 130.0f;
}

- (void)toggleButtonDidChange:(ToggleButton *)btn {
    [[NSUserDefaults standardUserDefaults] setBool:_btnUnknown.isSelected forKey:kBOOLPHACEUnknown];
}

- (void)enableToggleButtons:(BOOL)enabled {
    [_btnUnknown setUserInteractionEnabled:enabled];
    [_btnUnknown setHidden:!enabled];
    
    [_switchPHACE setUserInteractionEnabled:enabled];
    [_switchPHACE setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    
}

@end
