//
//  PastMedicationsUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "PastMedicationsUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@interface PastMedicationsUITableViewCell()

@property (nonatomic, strong) RadioGroup *group;

@end

@implementation PastMedicationsUITableViewCell
@synthesize group = _group;

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
    if (!_group) {
        _group = [[RadioGroup alloc] init];
        [_group registerButton:_btnGrade];
        [_group registerButton:_btnHigh];
        [_group registerButton:_btnTech];
        [_group registerButton:_btnCollege];
        [_group registerButton:_btnPostCollege];
        [_group registerButton:_btnUnknown];
        
        _btnGrade.layer.cornerRadius = 5;
        [_btnGrade setSelectedImageName:@"check-white"];
        [_btnGrade setImageName:@""];
        
        _btnHigh.layer.cornerRadius = 5;
        [_btnHigh setSelectedImageName:@"check-white"];
        [_btnHigh setImageName:@""];
        
        _btnTech.layer.cornerRadius = 5;
        [_btnTech setSelectedImageName:@"check-white"];
        [_btnTech setImageName:@""];
        
        _btnCollege.layer.cornerRadius = 5;
        [_btnCollege setSelectedImageName:@"check-white"];
        [_btnCollege setImageName:@""];
        
        _btnPostCollege.layer.cornerRadius = 5;
        [_btnPostCollege setSelectedImageName:@"check-white"];
        [_btnPostCollege setImageName:@""];
        
        _btnUnknown.layer.cornerRadius = 5;
        [_btnUnknown setSelectedImageName:@"check-white"];
        [_btnUnknown setImageName:@""];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLEducationCollege]) {
        [_group clickedButton:_btnCollege];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLEducationGrade]) {
        [_group clickedButton:_btnGrade];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLEducationHigh]) {
        [_group clickedButton:_btnHigh];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLEducationPostCollege]) {
        [_group clickedButton:_btnPostCollege];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLEducationTech]) {
        [_group clickedButton:_btnTech];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLEducationUnknown]) {
        [_group clickedButton:_btnUnknown];
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
        [self enableRadioButtons:NO];
        
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
    [self enableRadioButtons:YES];
    
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

- (IBAction)clickedRadioButton:(id)sender {
    [_group clickedButton:sender];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLEducationCollege];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLEducationGrade];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLEducationHigh];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLEducationPostCollege];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLEducationTech];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLEducationUnknown];
    
    if (sender == _btnCollege) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLEducationCollege];
    } else if (sender == _btnGrade) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLEducationGrade];
    } else if (sender == _btnHigh) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLEducationHigh];
    } else if (sender == _btnPostCollege) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLEducationPostCollege];
    } else if (sender == _btnTech) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLEducationTech];
    } else if (sender == _btnUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLEducationUnknown];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (float)expandedHeight {
    return 240.0f;
}

- (void)enableRadioButtons:(BOOL)enabled {
    [_btnGrade setUserInteractionEnabled:enabled];
    [_btnGrade setHidden:!enabled];
    
    [_btnHigh setUserInteractionEnabled:enabled];
    [_btnHigh setHidden:!enabled];
    
    [_btnTech setUserInteractionEnabled:enabled];
    [_btnTech setHidden:!enabled];
    
    [_btnCollege setUserInteractionEnabled:enabled];
    [_btnCollege setHidden:!enabled];
    
    [_btnPostCollege setUserInteractionEnabled:enabled];
    [_btnPostCollege setHidden:!enabled];
    
    [_btnUnknown setUserInteractionEnabled:enabled];
    [_btnUnknown setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    
}

@end
