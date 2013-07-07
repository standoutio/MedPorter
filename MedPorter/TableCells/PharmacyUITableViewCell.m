//
//  PharmacyUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "PharmacyUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@implementation PharmacyUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)initToggleButtons {
    _btnMale.layer.cornerRadius = 5;
    [_btnMale setSelectedImageName:@"check-white"];
    [_btnMale setImageName:@""];
    [_btnMale registerOppositeButton:_btnFemale];
    _btnMale.delegate = self;
    
    _btnFemale.layer.cornerRadius = 5;
    [_btnFemale setSelectedImageName:@"check-white"];
    [_btnFemale setImageName:@""];
    [_btnFemale registerOppositeButton:_btnMale];
    _btnFemale.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    [self initToggleButtons];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMale]) {
        [_btnMale turnOn];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLFemale]) {
        [_btnFemale turnOn];
    }
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
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

- (float)expandedHeight {
    return 120.0f;
}

- (void)toggleButtonDidChange:(ToggleButton *)btn {
    NSLog(@"toggle changed");
    if (btn == _btnFemale) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnFemale.isSelected forKey:kBOOLFemale];
    } else if (btn == _btnMale) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnFemale.isSelected forKey:kBOOLFemale];
    }
}

- (void)enableToggleButtons:(BOOL)enabled {
    [_btnFemale setUserInteractionEnabled:enabled];
    [_btnFemale setHidden:!enabled];
    
    [_btnMale setUserInteractionEnabled:enabled];
    [_btnMale setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    
}

@end
