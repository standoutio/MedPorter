//
//  DietUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "DietUITableViewCell.h"
#import "RadioGroup.h"
#import <QuartzCore/QuartzCore.h>
#import "UIButton+Switch.h"
#import "Constants.h"

@interface DietUITableViewCell()

@property (nonatomic, strong) RadioGroup *groupAssistedConception;
@property (nonatomic, strong) RadioGroup *groupMultipleGestation;
@property (nonatomic, strong) RadioGroup *groupMultipleGestationType;

@end

@implementation DietUITableViewCell

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
    
    [_switchAssistedConception initSwitch];
    [_switchMultipleGestation initSwitch];
    [_switchPreNatalInfertility initSwitch];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLPreNatalInfertility]) {
        [_switchPreNatalInfertility toggleOn];
    }
    
    if (!_groupAssistedConception) {
        _groupAssistedConception = [[RadioGroup alloc] init];
        [_groupAssistedConception registerButton:_btnInVitro];
        [_groupAssistedConception registerButton:_btnArtificialInsemination];
        [_groupAssistedConception registerButton:_btnICSE];
        [_groupAssistedConception registerButton:_btnClomid];
        [_groupAssistedConception registerButton:_btnUnknown];
        [_groupAssistedConception registerButton:_btnOther];
        
        _btnInVitro.layer.cornerRadius = 5;
        [_btnInVitro setSelectedImageName:@"check-white"];
        [_btnInVitro setImageName:@""];
        
        _btnArtificialInsemination.layer.cornerRadius = 5;
        [_btnArtificialInsemination setSelectedImageName:@"check-white"];
        [_btnArtificialInsemination setImageName:@""];
        
        _btnICSE.layer.cornerRadius = 5;
        [_btnICSE setSelectedImageName:@"check-white"];
        [_btnICSE setImageName:@""];
        
        _btnClomid.layer.cornerRadius = 5;
        [_btnClomid setSelectedImageName:@"check-white"];
        [_btnClomid setImageName:@""];
        
        _btnUnknown.layer.cornerRadius = 5;
        [_btnUnknown setSelectedImageName:@"check-white"];
        [_btnUnknown setImageName:@""];
        
        _btnOther.layer.cornerRadius = 5;
        [_btnOther setSelectedImageName:@"check-white"];
        [_btnOther setImageName:@""];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAssistedConception]) {
        [_switchAssistedConception toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAssistedConceptionInVitroFertilization]) {
        [_groupAssistedConception clickedButton:_btnInVitro];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAssistedConceptionICSE]) {
        [_groupAssistedConception clickedButton:_btnICSE];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAssistedConceptionArtificialInsemination]) {
        [_groupAssistedConception clickedButton:_btnArtificialInsemination];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAssistedConceptionClomid]) {
        [_groupAssistedConception clickedButton:_btnClomid];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAssistedConceptionUnknown]) {
        [_groupAssistedConception clickedButton:_btnUnknown];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLAssistedConceptionOther]) {
        [_groupAssistedConception clickedButton:_btnOther];
    }
    if (!_groupMultipleGestation) {
        _groupMultipleGestation = [[RadioGroup alloc] init];
        [_groupMultipleGestation registerButton:_btnTwin];
        [_groupMultipleGestation registerButton:_btnTriplet];
        [_groupMultipleGestation registerButton:_btnGreaterThanTriplet];
        
        _btnTwin.layer.cornerRadius = 5;
        [_btnTwin setSelectedImageName:@"check-white"];
        [_btnTwin setImageName:@""];
        
        _btnTriplet.layer.cornerRadius = 5;
        [_btnTriplet setSelectedImageName:@"check-white"];
        [_btnTriplet setImageName:@""];
        
        _btnGreaterThanTriplet.layer.cornerRadius = 5;
        [_btnGreaterThanTriplet setSelectedImageName:@"check-white"];
        [_btnGreaterThanTriplet setImageName:@""];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMultipleGestation]) {
        [_switchMultipleGestation toggleOn];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMultipleGestationTwin]) {
        [_groupMultipleGestation clickedButton:_btnTwin];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMultipleGestationTriplet]) {
        [_groupMultipleGestation clickedButton:_btnTriplet];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMultipleGestationGreaterThanTriplet]) {
        [_groupMultipleGestation clickedButton:_btnGreaterThanTriplet];
    }
    if (!_groupMultipleGestationType) {
        _groupMultipleGestationType = [[RadioGroup alloc] init];
        [_groupMultipleGestationType registerButton:_btnMonozygotic];
        [_groupMultipleGestationType registerButton:_btnDizyotic];
        [_groupMultipleGestationType registerButton:_btnMixed];
        [_groupMultipleGestationType registerButton:_btnUnknownGestation];
        
        _btnMonozygotic.layer.cornerRadius = 5;
        [_btnMonozygotic setSelectedImageName:@"check-white"];
        [_btnMonozygotic setImageName:@""];
        
        _btnDizyotic.layer.cornerRadius = 5;
        [_btnDizyotic setSelectedImageName:@"check-white"];
        [_btnDizyotic setImageName:@""];
        
        _btnMixed.layer.cornerRadius = 5;
        [_btnMixed setSelectedImageName:@"check-white"];
        [_btnMixed setImageName:@""];
        
        _btnUnknownGestation.layer.cornerRadius = 5;
        [_btnUnknownGestation setSelectedImageName:@"check-white"];
        [_btnUnknownGestation setImageName:@""];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMultipleGestationTypeMonozygotic]) {
        [_groupMultipleGestationType clickedButton:_btnMonozygotic];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMultipleGestationTypeDizyotic]) {
        [_groupMultipleGestationType clickedButton:_btnDizyotic];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMultipleGestationTypeMixed]) {
        [_groupMultipleGestationType clickedButton:_btnMixed];
    } else if ([[NSUserDefaults standardUserDefaults] boolForKey:kBOOLMultipleGestationTypeUnknown]) {
        [_groupMultipleGestationType clickedButton:_btnUnknownGestation];
    }
    
    [_txtPregnancies setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtMiscarriages setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtOther setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtPregnancies setText:[[NSUserDefaults standardUserDefaults] valueForKey:kNumberOfPregnancies]];
    [_txtMiscarriages setText:[[NSUserDefaults standardUserDefaults] valueForKey:kNumberOfSpontaneousMiscarriages]];
    [_txtOther setText:[[NSUserDefaults standardUserDefaults] valueForKey:kAssistedConceptionOther]];
    
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
    [((UIButton *)sender) toggleOn];
    if (sender == _switchAssistedConception) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchAssistedConception.isOn forKey:kBOOLAssistedConception];
    } else if (sender == _switchMultipleGestation) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchMultipleGestation.isOn forKey:kBOOLMultipleGestation];
    } else if (sender == _switchPreNatalInfertility) {
        [[NSUserDefaults standardUserDefaults] setBool:_switchPreNatalInfertility.isOn forKey:kBOOLPreNatalInfertility];
    }
}

- (float)expandedHeight {
    return 770.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtPregnancies setUserInteractionEnabled:enabled];
    [_txtPregnancies setHidden:!enabled];
    
    [_txtMiscarriages setUserInteractionEnabled:enabled];
    [_txtMiscarriages setHidden:!enabled];
    
    [_txtOther setUserInteractionEnabled:enabled];
    [_txtOther setHidden:!enabled];
    
    [_switchAssistedConception setUserInteractionEnabled:enabled];
    [_switchAssistedConception setHidden:!enabled];
    
    [_switchMultipleGestation setUserInteractionEnabled:enabled];
    [_switchMultipleGestation setHidden:!enabled];
    
    [_switchPreNatalInfertility setUserInteractionEnabled:enabled];
    [_switchPreNatalInfertility setHidden:!enabled];
    
    for (RadioButton *rb in _groupAssistedConception.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (RadioButton *rb in _groupMultipleGestation.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (RadioButton *rb in _groupMultipleGestationType.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtPregnancies) {
        [_txtMiscarriages becomeFirstResponder];
    }
    [[NSUserDefaults standardUserDefaults] setValue:_txtMiscarriages.text forKey:kNumberOfSpontaneousMiscarriages];
    [[NSUserDefaults standardUserDefaults] setValue:_txtPregnancies.text forKey:kNumberOfPregnancies];
    [[NSUserDefaults standardUserDefaults] setValue:_txtOther.text forKey:kAssistedConceptionOther];
    return YES;
}

- (IBAction)clickedAssistedConception:(id)sender {
    [_groupAssistedConception clickedButton:sender];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLAssistedConceptionArtificialInsemination];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLAssistedConceptionClomid];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLAssistedConceptionICSE];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLAssistedConceptionInVitroFertilization];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLAssistedConceptionOther];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLAssistedConceptionUnknown];
    if (sender == _btnArtificialInsemination) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLAssistedConceptionArtificialInsemination];
    } else if (sender == _btnClomid) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLAssistedConceptionClomid];
    } else if (sender == _btnICSE) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLAssistedConceptionICSE];
    } else if (sender == _btnInVitro) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLAssistedConceptionInVitroFertilization];
    } else if (sender == _btnOther) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLAssistedConceptionOther];
    } else if (sender == _btnUnknown) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLAssistedConceptionUnknown];
    }
}

- (IBAction)clickedMultipleGestation:(id)sender {
    [_groupMultipleGestation clickedButton:sender];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMultipleGestationTwin];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMultipleGestationTriplet];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMultipleGestationGreaterThanTriplet];
    if (sender == _btnTwin) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMultipleGestationTwin];
    } else if (sender == _btnTriplet) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMultipleGestationTriplet];
    } else if (sender == _btnGreaterThanTriplet) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMultipleGestationGreaterThanTriplet];
    }
}

- (IBAction)clickedMultipleGestationType:(id)sender {
    [_groupMultipleGestationType clickedButton:sender];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMultipleGestationTypeMonozygotic];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMultipleGestationTypeDizyotic];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMultipleGestationTypeMixed];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kBOOLMultipleGestationTypeUnknown];
    if (sender == _btnArtificialInsemination) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMultipleGestationTypeMonozygotic];
    } else if (sender == _btnClomid) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMultipleGestationTypeDizyotic];
    } else if (sender == _btnICSE) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMultipleGestationTypeMixed];
    } else if (sender == _btnInVitro) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kBOOLMultipleGestationTypeUnknown];
    }
}

- (void)checkForFinish {
    
}

@end
