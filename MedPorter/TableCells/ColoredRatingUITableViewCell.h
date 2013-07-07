//
//  ColoredRatingUITableViewCell.h
//  Discharge
//
//  Created by dev on 6/1/13.
//  Copyright (c) 2013 Catalyze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColoredRatingUITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btnLevel1;
@property (weak, nonatomic) IBOutlet UIButton *btnLevel2;
@property (weak, nonatomic) IBOutlet UIButton *btnLevel3;
@property (weak, nonatomic) IBOutlet UIButton *btnLevel4;
@property (weak, nonatomic) IBOutlet UIButton *btnLevel5;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
- (IBAction)chooseLevel1:(id)sender;
- (IBAction)chooseLevel2:(id)sender;
- (IBAction)chooseLevel3:(id)sender;
- (IBAction)chooseLevel4:(id)sender;
- (IBAction)chooseLevel5:(id)sender;
- (void)setCellDescription:(NSString *)description;

@end
