//
//  FamilyMembersUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/18/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "FamilyMembersUITableViewCell.h"
#import "Constants.h"

@interface FamilyMembersUITableViewCell()

@property (nonatomic, strong) NSMutableArray *subcells;

@end

@implementation FamilyMembersUITableViewCell

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
    [_lblPlus setFont:[UIFont fontWithName:@"Raleway" size:26.0f]];
    
    [_lblTitle setFont:[UIFont fontWithName:@"Raleway" size:18.0f]];
    [_lblTitle setText:title];
    
    if (!_subcells) {
        _subcells = [[NSMutableArray alloc] init];
    }
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    
    [_txtNumber setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtNumber setText:[[NSUserDefaults standardUserDefaults] valueForKey:kNumberHemangiomas]];
    
    for (int i = 0;i<_subcells.count;i++) {
        //[((NumberLocationSubCell *)[_subcells objectAtIndex:i]) updateCellWithNumber:i];
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

- (void)addSubCells {
    for (UIView *v in _subcells) {
        [v removeFromSuperview];
    }
    [_subcells removeAllObjects];
    
    int numSubCells = [[NSUserDefaults standardUserDefaults] integerForKey:kNumberHemangiomas];
    UIView *lastView = _txtNumber;
    for (int i=0;i<numSubCells;i++) {
        /*NumberLocationSubCell *sub = [[NumberLocationSubCell alloc] init];
        [_subcells addObject:sub];
        [sub setFrame:CGRectMake(0, lastView.frame.size.height + lastView.frame.origin.y + 8, sub.frame.size.width, sub.frame.size.height)];
        [sub updateCellWithNumber:i];
        [self addSubview:sub];
        lastView = sub;*/
    }
    NSLog(@"we have %i sub cells added",_subcells.count);
    [self bringSubviewToFront:_background];
    [self bringSubviewToFront:_lblPlus];
    [self bringSubviewToFront:_lblTitle];
    [self bringSubviewToFront:_imgCheck];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)uncover:(AnimationBlock)block {
    [self enableTextFields:YES];
    [self addSubCells];
    
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
    return 130.0f + (760.0f * [[[NSUserDefaults standardUserDefaults] valueForKey:kNumberHemangiomas] integerValue]) + (8.0f * ([[[NSUserDefaults standardUserDefaults] valueForKey:kNumberHemangiomas] integerValue] + 1));
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setValue:_txtNumber.text forKey:kNumberHemangiomas];
    [self addSubCells];
    return YES;
}

- (void)enableTextFields:(BOOL)enabled {
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
    
    [_txtNumber setUserInteractionEnabled:enabled];
    [_txtNumber setHidden:!enabled];
    
    /*for (NumberLocationSubCell *sub in _subcells) {
        [sub setUserInteractionEnabled:enabled];
        [sub setHidden:!enabled];
    }*/
}

- (void)checkForFinish {
    
}

@end
