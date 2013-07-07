//
//  VaccinationsUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "VaccinationsUITableViewCell.h"
#import "RadioGroup.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@interface VaccinationsUITableViewCell()

@property (nonatomic, strong) RadioGroup *groupMethodOfDelivery;

@end

@implementation VaccinationsUITableViewCell

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
    
    if (!_groupMethodOfDelivery) {
        _groupMethodOfDelivery = [[RadioGroup alloc] init];
        [_groupMethodOfDelivery registerButton:_btnUnassisted];
        [_groupMethodOfDelivery registerButton:_btnAssistedForceps];
        [_groupMethodOfDelivery registerButton:_btnAssistedVacuum];
        [_groupMethodOfDelivery registerButton:_btnDrugInducedPitocin];
        [_groupMethodOfDelivery registerButton:_btnDrugInducedOther];
        [_groupMethodOfDelivery registerButton:_btnCSection];
        [_groupMethodOfDelivery registerButton:_btnUnknown];
        
        _btnUnassisted.layer.cornerRadius = 5;
        [_btnUnassisted setSelectedImageName:@"check-white"];
        [_btnUnassisted setImageName:@""];
        
        _btnAssistedForceps.layer.cornerRadius = 5;
        [_btnAssistedForceps setSelectedImageName:@"check-white"];
        [_btnAssistedForceps setImageName:@""];
        
        _btnAssistedVacuum.layer.cornerRadius = 5;
        [_btnAssistedVacuum setSelectedImageName:@"check-white"];
        [_btnAssistedVacuum setImageName:@""];
        
        _btnDrugInducedPitocin.layer.cornerRadius = 5;
        [_btnDrugInducedPitocin setSelectedImageName:@"check-white"];
        [_btnDrugInducedPitocin setImageName:@""];
        
        _btnDrugInducedOther.layer.cornerRadius = 5;
        [_btnDrugInducedOther setSelectedImageName:@"check-white"];
        [_btnDrugInducedOther setImageName:@""];
        
        _btnCSection.layer.cornerRadius = 5;
        [_btnCSection setSelectedImageName:@"check-white"];
        [_btnCSection setImageName:@""];
        
        _btnUnknown.layer.cornerRadius = 5;
        [_btnUnknown setSelectedImageName:@"check-white"];
        [_btnUnknown setImageName:@""];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMethodOfDeliveryVaginalUnassisted]) {
        [_groupMethodOfDelivery clickedButton:_btnUnassisted];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMethodOfDeliveryVaginalAssistedForceps]) {
        [_groupMethodOfDelivery clickedButton:_btnAssistedForceps];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMethodOfDeliveryVaginalAssistedVacuum]) {
        [_groupMethodOfDelivery clickedButton:_btnAssistedVacuum];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMethodOfDeliveryVaginalDrugInducedPitocin]) {
        [_groupMethodOfDelivery clickedButton:_btnDrugInducedPitocin];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMethodOfDeliveryVaginalDrugInducedOther]) {
        [_groupMethodOfDelivery clickedButton:_btnDrugInducedOther];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMethodOfDeliveryCSection]) {
        [_groupMethodOfDelivery clickedButton:_btnCSection];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMethodOfDeliveryUnknown]) {
        [_groupMethodOfDelivery clickedButton:_btnUnknown];
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
        [_lblPlus setTextColor:[UIColor colorWithRed:231.0/255.0 green:76.0/255.0 blue:60.0/255.0 alpha:1.0f]];
        [_lblTitle setTextColor:[UIColor colorWithRed:231.0/255.0 green:76.0/255.0 blue:60.0/255.0 alpha:1.0f]];
        
        CGRect frame = _background.frame;
        frame.origin.x = self.frame.size.width;
        [_background setFrame:frame];
    } completion:^(BOOL finished) {
        if (block != nil) {
            block(finished);
        }
    }];
}

- (IBAction)clickedMethodOfDelivery:(id)sender {
    [_groupMethodOfDelivery clickedButton:sender];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMethodOfDeliveryVaginalUnassisted];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMethodOfDeliveryVaginalAssistedForceps];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMethodOfDeliveryVaginalAssistedVacuum];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMethodOfDeliveryVaginalDrugInducedPitocin];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMethodOfDeliveryVaginalDrugInducedOther];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMethodOfDeliveryCSection];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMethodOfDeliveryUnknown];
    if (sender == _btnUnassisted) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMethodOfDeliveryVaginalUnassisted];
    } else if (sender == _btnAssistedForceps) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMethodOfDeliveryVaginalAssistedForceps];
    } else if (sender == _btnAssistedVacuum) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMethodOfDeliveryVaginalAssistedVacuum];
    } else if (sender == _btnDrugInducedPitocin) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMethodOfDeliveryVaginalDrugInducedPitocin];
    } else if (sender == _btnDrugInducedOther) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMethodOfDeliveryVaginalDrugInducedOther];
    } else if (sender == _btnCSection) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMethodOfDeliveryCSection];
    } else if (sender == _btnUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMethodOfDeliveryUnknown];
    }
}

- (float)expandedHeight {
    return 350.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    for (RadioButton *rb in _groupMethodOfDelivery.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    
}

@end
