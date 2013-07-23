//
//  TravelUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "TravelUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"

@implementation TravelUITableViewCell

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
    
    [_switchPrescription initSwitch];
    [_switchNonPrescription initSwitch];
    [_switchVitamins initSwitch];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPrescriptionMedications]) {
        [_switchPrescription toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLNonPrescriptionMedications]) {
        [_switchNonPrescription toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPreNatalVitamins]) {
        [_switchVitamins toggleOn];
    }
    
    [_txtPrescription setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtNonPrescription setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtVitamins setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtPrescription setText:[[NSUserDefaults standardUserDefaults] valueForKey:kPrescriptionMedications]];
    [_txtNonPrescription setText:[[NSUserDefaults standardUserDefaults] valueForKey:kNonPrescriptionMedications]];
    [_txtVitamins setText:[[NSUserDefaults standardUserDefaults] valueForKey:kPreNatalVitamins]];
    
    [_sliderNonPrescription setValue:[[NSUserDefaults standardUserDefaults] floatForKey:kNonPrescriptionMedicationsTrimester]];
    [_sliderPrescription setValue:[[NSUserDefaults standardUserDefaults] floatForKey:kPrescriptionMedicationsTrimester]];
    [_sliderVitamins setValue:[[NSUserDefaults standardUserDefaults] floatForKey:kPreNatalVitaminsTrimester]];
    
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

- (IBAction)sliderValueChanged:(id)sender {
    if (sender == _sliderPrescription) {
        [[NSUserDefaults standardUserDefaults] setFloat:(int)_sliderPrescription.value forKey:kPrescriptionMedicationsTrimester];
    } else if (sender == _sliderNonPrescription) {
        [[NSUserDefaults standardUserDefaults] setFloat:(int)_sliderNonPrescription.value forKey:kNonPrescriptionMedicationsTrimester];
    } else if (sender == _sliderVitamins) {
        [[NSUserDefaults standardUserDefaults] setFloat:(int)_sliderVitamins.value forKey:kPreNatalVitaminsTrimester];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)clickedPrescriptionSwitch:(id)sender {
    [sender toggleOn];
    [[NSUserDefaults standardUserDefaults] setBool:_switchPrescription.isOn forKey:kBOOLPrescriptionMedications];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (float)expandedHeight {
    return 640.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtPrescription setUserInteractionEnabled:enabled];
    [_txtPrescription setHidden:!enabled];
    
    [_txtNonPrescription setUserInteractionEnabled:enabled];
    [_txtNonPrescription setHidden:!enabled];
    
    [_txtVitamins setUserInteractionEnabled:enabled];
    [_txtVitamins setHidden:!enabled];
    
    [_switchPrescription setUserInteractionEnabled:enabled];
    [_switchPrescription setHidden:!enabled];
    
    [_switchNonPrescription setUserInteractionEnabled:enabled];
    [_switchNonPrescription setHidden:!enabled];
    
    [_switchVitamins setUserInteractionEnabled:enabled];
    [_switchVitamins setHidden:!enabled];
    
    [_sliderPrescription setUserInteractionEnabled:enabled];
    [_sliderPrescription setHidden:!enabled];
    
    [_sliderNonPrescription setUserInteractionEnabled:enabled];
    [_sliderNonPrescription setHidden:!enabled];
    
    [_sliderVitamins setUserInteractionEnabled:enabled];
    [_sliderVitamins setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setValue:_txtPrescription.text forKey:kPrescriptionMedications];
    [[NSUserDefaults standardUserDefaults] setValue:_txtNonPrescription.text forKey:kNonPrescriptionMedications];
    [[NSUserDefaults standardUserDefaults] setValue:_txtVitamins.text forKey:kPreNatalVitamins];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

- (IBAction)clickedNonPrescriptionSwitch:(id)sender {
    [sender toggleOn];
    [[NSUserDefaults standardUserDefaults] setBool:_switchNonPrescription.isOn forKey:kBOOLNonPrescriptionMedications];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)clickedVitaminsSwitch:(id)sender {
    [sender toggleOn];
    [[NSUserDefaults standardUserDefaults] setBool:_switchVitamins.isOn forKey:kBOOLPreNatalVitamins];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)checkForFinish {
    
}

@end
