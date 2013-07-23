//
//  SurgeriesUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "SurgeriesUITableViewCell.h"
#import "UIButton+Switch.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@implementation SurgeriesUITableViewCell

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
    for (UILabel *l in _smallLabels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    for (ToggleButton *tb in _toggleButtons) {
        tb.layer.cornerRadius = 5;
        tb.selectedImageName = @"check-white";
        tb.imageName = @"";
        tb.delegate = self;
    }
    
    for (UIButton *b in _switches) {
        [b initSwitch];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLCongenitalHeartDisease]) {
        [_switchCongenitalHeartDisease toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAbnormalitiesOfAorta]) {
        [_switchAbnormalitiesOfAorta toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAbnormalitiesOfBloodVessels]) {
        [_switchAbnormalitiesOfBloodVessels toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLSeizures]) {
        [_switchSeizures toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLDevelopmentalDelay]) {
        [_switchDevelopmentalDelay toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLHypertension]) {
        [_switchHypertension toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLStroke]) {
        [_switchStroke toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMigraine]) {
        [_switchMigraine toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLOcularAbnormalities]) {
        [_switchOcularAbnormalities toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLEndocrineAbnormalities]) {
        [_switchEndocrineAbnormalities toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMastocytosis]) {
        [_switchMastocytosis toggleOn];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLCongenitalHeartDiseaseUnknown]) {
        [_btnCongenitalHeartDisease turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAbnormalitiesOfAortaUnknown]) {
        [_btnAbnormalitiesOfAorta turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAbnormalitiesOfBloodVesselsUnknown]) {
        [_btnAbnormalitiesOfBloodVessels turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLSeizuresUnknown]) {
        [_btnSeizures turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLDevelopmentalDelayUnknown]) {
        [_btnDevelopmentalDelay turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLHypertensionUnknown]) {
        [_btnHypertension turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLStrokeUnknown]) {
        [_btnStroke turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMigraineUnknown]) {
        [_btnMigraine turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLOcularAbnormalitiesUnknown]) {
        [_btnOcularAbnormalities turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLEndocrineAbnormalitiesUnknown]) {
        [_btnEndocrineAbnormalities turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMastocytosisUnknown]) {
        [_btnMastocytosis turnOn];
    }
    
    [_txtComments setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtComments setText:[[NSUserDefaults standardUserDefaults] valueForKey:kChildsMedicalHistoryComments]];
    
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

- (IBAction)clickedSwitch:(id)sender {
    [sender toggleOn];
    if (sender == _switchAbnormalitiesOfAorta) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchAbnormalitiesOfAorta.isOn forKey:kBOOLAbnormalitiesOfAorta];
    } else if (sender == _switchAbnormalitiesOfBloodVessels) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchAbnormalitiesOfBloodVessels.isOn forKey:kBOOLAbnormalitiesOfBloodVessels];
    } else if (sender == _switchCongenitalHeartDisease) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchCongenitalHeartDisease.isOn forKey:kBOOLCongenitalHeartDisease];
    } else if (sender == _switchDevelopmentalDelay) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchDevelopmentalDelay.isOn forKey:kBOOLDevelopmentalDelay];
    } else if (sender == _switchEndocrineAbnormalities) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchEndocrineAbnormalities.isOn forKey:kBOOLEndocrineAbnormalities];
    } else if (sender == _switchHypertension) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchHypertension.isOn forKey:kBOOLHypertension];
    } else if (sender == _switchMastocytosis) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchMastocytosis.isOn forKey:kBOOLMastocytosis];
    } else if (sender == _switchMigraine) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchMigraine.isOn forKey:kBOOLMigraine];
    } else if (sender == _switchOcularAbnormalities) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchOcularAbnormalities.isOn forKey:kBOOLOcularAbnormalities];
    } else if (sender == _switchSeizures) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchSeizures.isOn forKey:kBOOLSeizures];
    } else if (sender == _switchStroke) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchStroke.isOn forKey:kBOOLStroke];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (float)expandedHeight {
    return 705.0f;
}

- (void)toggleButtonDidChange:(ToggleButton *)btn {
    if (btn == _btnAbnormalitiesOfAorta) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnAbnormalitiesOfAorta.isSelected forKey:kBOOLAbnormalitiesOfAortaUnknown];
    } else if (btn == _btnAbnormalitiesOfBloodVessels) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnAbnormalitiesOfBloodVessels.isSelected forKey:kBOOLAbnormalitiesOfBloodVesselsUnknown];
    } else if (btn == _btnCongenitalHeartDisease) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnCongenitalHeartDisease.isSelected forKey:kBOOLCongenitalHeartDiseaseUnknown];
    } else if (btn == _btnDevelopmentalDelay) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnDevelopmentalDelay.isSelected forKey:kBOOLDevelopmentalDelayUnknown];
    } else if (btn == _btnEndocrineAbnormalities) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnEndocrineAbnormalities.isSelected forKey:kBOOLEndocrineAbnormalitiesUnknown];
    } else if (btn == _btnHypertension) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnHypertension.isSelected forKey:kBOOLHypertensionUnknown];
    } else if (btn == _btnMastocytosis) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnMastocytosis.isSelected forKey:kBOOLMastocytosisUnknown];
    } else if (btn == _btnMigraine) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnMigraine.isSelected forKey:kBOOLMigraineUnknown];
    } else if (btn == _btnOcularAbnormalities) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnOcularAbnormalities.isSelected forKey:kBOOLOcularAbnormalitiesUnknown];
    } else if (btn == _btnSeizures) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnSeizures.isSelected forKey:kBOOLSeizuresUnknown];
    } else if (btn == _btnStroke) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnStroke.isSelected forKey:kBOOLStrokeUnknown];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setValue:_txtComments.text forKey:kChildsMedicalHistoryComments];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

- (void)enableTextFields:(BOOL)enabled {
    for (UILabel *l in _smallLabels) {
        [l setHidden:!enabled];
    }
    
    for (ToggleButton *tb in _toggleButtons) {
        [tb setUserInteractionEnabled:enabled];
        [tb setHidden:!enabled];
    }
    
    for (UIButton *b in _switches) {
        [b setUserInteractionEnabled:enabled];
        [b setHidden:!enabled];
    }
    
    [_txtComments setUserInteractionEnabled:enabled];
    [_txtComments setHidden:!enabled];
}

- (void)checkForFinish {
    
}

@end
