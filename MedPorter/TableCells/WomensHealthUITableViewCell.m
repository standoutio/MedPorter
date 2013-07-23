//
//  WomensHealthUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "WomensHealthUITableViewCell.h"
#import "UIButton+Switch.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@implementation WomensHealthUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initToggleButtons {
    for (ToggleButton *tb in _radioButtons) {
        tb.layer.cornerRadius = 5;
        tb.selectedImageName = @"check-white";
        tb.imageName = @"";
        tb.delegate = self;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    [self initToggleButtons];
    
    for (UILabel *l in _smallLabels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    [_lblPlus setFont:[UIFont fontWithName:@"Raleway" size:26.0f]];
    
    [_lblTitle setFont:[UIFont fontWithName:@"Raleway" size:18.0f]];
    [_lblTitle setText:title];
    
    [_txtOtherAirway setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtOtherVisual setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtOtherAirway setText:[[NSUserDefaults standardUserDefaults] valueForKey:kAirwayObstructionOther]];
    [_txtOtherVisual setText:[[NSUserDefaults standardUserDefaults] valueForKey:kVisualCompromiseOther]];
    
    [_switchAirwayObstruction initSwitch];
    [_switchAuditoryCanal initSwitch];
    [_switchBleeding initSwitch];
    [_switchComplications initSwitch];
    [_switchPain initSwitch];
    [_switchUlceration initSwitch];
    [_switchVisualCompromise initSwitch];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAirwayObstruction]) {
        [_switchAirwayObstruction toggleOn];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsAuditoryCanalObstruction]) {
        [_switchAuditoryCanal toggleOn];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsBleeding]) {
        [_switchBleeding toggleOn];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplications]) {
        [_switchComplications toggleOn];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsPain]) {
        [_switchPain toggleOn];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsUlceration]) {
        [_switchUlceration toggleOn];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromise]) {
        [_switchVisualCompromise toggleOn];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsUnknown]) {
        [_btnComplicationsUnknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsUlcerationUnknown]) {
        [_btnUlcerationUnknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsBleedingUnknown]) {
        [_btnBleedingUnknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsAuditroyCanalObstructionUnknown]) {
        [_btnAuditoryCanalUnknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLComplicationsPainUnknown]) {
        [_btnPainUnknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromiseUnknown]) {
        [_btnVisualCompromiseUnknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromiseObstructionOfVisualAxis]) {
        [_btnObstructionOfVisualAxis turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromiseRefractoryError]) {
        [_btnRefractoryError turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromiseTearDuctObstruction]) {
        [_btnTearDuctObstruction turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromiseAmblyopia]) {
        [_btnAmblyopia turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromiseRetrobulbarInvolvement]) {
        [_btnRetrobulbarInvolvement turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromiseUnknownUnknown]) {
        [_btnVisualCompromiseUnknownUnknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLVisualCompromiseOther]) {
        [_btnVisualCompromiseOther turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAirwayObstructionUnknown]) {
        [_btnAirwayObstructionUknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAirwayObstructionAirwayHemangioma]) {
        [_btnAirwayHemangioma turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAirwayObstructionNasalObstruction]) {
        [_btnNasalObstruction turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAirwayObstructionExternalAirwayCompression]) {
        [_btnExternalAirwayCompression turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAirwayObstructionUnknownUnknown]) {
        [_btnAirwayObstructionUnknownUnknown turnOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAirwayObstructionOther]) {
        [_btnAirwayObstructionOther turnOn];
    }
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

- (IBAction)clickedSwitch:(id)sender {
    [sender toggleOn];
    if (sender == _switchAirwayObstruction) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchAirwayObstruction.isOn forKey:kBOOLAirwayObstruction];
    } else if (sender == _switchAuditoryCanal) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchAuditoryCanal.isOn forKey:kBOOLComplicationsAuditoryCanalObstruction];
    } else if (sender == _switchBleeding) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchBleeding.isOn forKey:kBOOLComplicationsBleeding];
    } else if (sender == _switchComplications) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchComplications.isOn forKey:kBOOLComplications];
    } else if (sender == _switchPain) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchPain.isOn forKey:kBOOLComplicationsPain];
    } else if (sender == _switchUlceration) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchUlceration.isOn forKey:kBOOLComplicationsUlceration];
    } else if (sender == _switchVisualCompromise) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchVisualCompromise.isOn forKey:kBOOLVisualCompromise];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (float)expandedHeight {
    return 745.0f;
}

- (void)toggleButtonDidChange:(ToggleButton *)btn {
    if (btn == _btnAirwayHemangioma) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnAirwayHemangioma.isSelected forKey:kBOOLAirwayObstructionAirwayHemangioma];
    } else if (btn == _btnAirwayObstructionOther) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnAirwayObstructionOther.isSelected forKey:kBOOLAirwayObstructionOther];
    } else if (btn == _btnAirwayObstructionUknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnAirwayObstructionUknown.isSelected forKey:kBOOLAirwayObstructionUnknown];
    } else if (btn == _btnAirwayObstructionUnknownUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnAirwayObstructionUnknownUnknown.isSelected forKey:kBOOLAirwayObstructionUnknownUnknown];
    } else if (btn == _btnAmblyopia) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnAmblyopia.isSelected forKey:kBOOLVisualCompromiseAmblyopia];
    } else if (btn == _btnAuditoryCanalUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnAuditoryCanalUnknown.isSelected forKey:kBOOLComplicationsAuditroyCanalObstructionUnknown];
    } else if (btn == _btnBleedingUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnBleedingUnknown.isSelected forKey:kBOOLComplicationsBleedingUnknown];
    } else if (btn == _btnComplicationsUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnComplicationsUnknown.isSelected forKey:kBOOLComplicationsUnknown];
    } else if (btn == _btnExternalAirwayCompression) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnExternalAirwayCompression.isSelected forKey:kBOOLAirwayObstructionExternalAirwayCompression];
    } else if (btn == _btnNasalObstruction) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnNasalObstruction.isSelected forKey:kBOOLAirwayObstructionNasalObstruction];
    } else if (btn == _btnObstructionOfVisualAxis) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnObstructionOfVisualAxis.isSelected forKey:kBOOLVisualCompromiseObstructionOfVisualAxis];
    } else if (btn == _btnPainUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnPainUnknown.isSelected forKey:kBOOLComplicationsPainUnknown];
    } else if (btn == _btnRefractoryError) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnRefractoryError.isSelected forKey:kBOOLVisualCompromiseRefractoryError];
    } else if (btn == _btnRetrobulbarInvolvement) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnRetrobulbarInvolvement.isSelected forKey:kBOOLVisualCompromiseRetrobulbarInvolvement];
    } else if (btn == _btnTearDuctObstruction) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnTearDuctObstruction.isSelected forKey:kBOOLVisualCompromiseTearDuctObstruction];
    } else if (btn == _btnUlcerationUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnUlcerationUnknown.isSelected forKey:kBOOLComplicationsUlcerationUnknown];
    } else if (btn == _btnVisualCompromiseOther) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnVisualCompromiseOther.isSelected forKey:kBOOLVisualCompromiseOther];
    } else if (btn == _btnVisualCompromiseUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnVisualCompromiseUnknown.isSelected forKey:kBOOLVisualCompromiseUnknown];
    } else if (btn == _btnVisualCompromiseUnknownUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:_btnVisualCompromiseUnknownUnknown.isSelected forKey:kBOOLVisualCompromiseUnknownUnknown];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setValue:_txtOtherAirway.text forKey:kAirwayObstructionOther];
    [[NSUserDefaults standardUserDefaults] setValue:_txtOtherVisual.text forKey:kVisualCompromiseOther];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

- (void)enableTextFields:(BOOL)enabled {
    for (UILabel *l in _smallLabels) {
        [l setHidden:!enabled];
    }
    
    for (ToggleButton *tb in _radioButtons) {
        [tb setUserInteractionEnabled:enabled];
        [tb setHidden:!enabled];
    }
    
    [_txtOtherAirway setUserInteractionEnabled:enabled];
    [_txtOtherAirway setHidden:!enabled];
    
    [_txtOtherVisual setUserInteractionEnabled:enabled];
    [_txtOtherVisual setHidden:!enabled];
    
    [_switchAirwayObstruction setUserInteractionEnabled:enabled];
    [_switchAirwayObstruction setHidden:!enabled];
    
    [_switchAuditoryCanal setUserInteractionEnabled:enabled];
    [_switchAuditoryCanal setHidden:!enabled];
    
    [_switchBleeding setUserInteractionEnabled:enabled];
    [_switchBleeding setHidden:!enabled];
    
    [_switchComplications setUserInteractionEnabled:enabled];
    [_switchComplications setHidden:!enabled];
    
    [_switchPain setUserInteractionEnabled:enabled];
    [_switchPain setHidden:!enabled];
    
    [_switchUlceration setUserInteractionEnabled:enabled];
    [_switchUlceration setHidden:!enabled];
    
    [_switchVisualCompromise setUserInteractionEnabled:enabled];
    [_switchVisualCompromise setHidden:!enabled];
}

- (void)checkForFinish {
    
}

@end
