//
//  SocialProfileViewController.m
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "SocialProfileViewController.h"
#import "CustomUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface SocialProfileViewController ()

@property int expandedIndex;

@end

@implementation SocialProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:@"MedPorterProfileViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.btnSocial setUserInteractionEnabled:NO];
    [self.btnSocial setBackgroundColor:[UIColor colorWithRed:52.0/255.0 green:73.0/255.0 blue:94.0/255.0 alpha:1.0f]];
    
    _expandedIndex = -1;
    
    self.tbl.dataSource = self;
    self.tbl.delegate = self;
    [self.tbl registerNib:[UINib nibWithNibName:@"FamilyMembersUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"FamilyMembersCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"FamilyConditionsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"FamilyConditionsCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"SmokingUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SmokingCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"AlcoholDrugUseUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"AlcoholDrugUseCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"ExposuresUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ExposuresCellIdentifier"];
    [self.tbl reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell<CustomUITableViewCell> *cell = nil;
    switch (indexPath.row) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"FamilyMembersCellIdentifier"];
            [cell updateCellWithTitle:@"family members"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"FamilyConditionsCellIdentifier"];
            [cell updateCellWithTitle:@"family conditions"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"SmokingCellIdentifier"];
            [cell updateCellWithTitle:@"smoking"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"AlcoholDrugUseCellIdentifier"];
            [cell updateCellWithTitle:@"alcohol & drug use"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"ExposuresCellIdentifier"];
            [cell updateCellWithTitle:@"exposures"];
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _expandedIndex == indexPath.row ? [((UITableViewCell<CustomUITableViewCell> *)[self tableView:self.tbl cellForRowAtIndexPath:indexPath]) expandedHeight] : 66.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_expandedIndex == indexPath.row) {
        _expandedIndex = -1;
        [((UITableViewCell<CustomUITableViewCell> *)[tableView cellForRowAtIndexPath:indexPath]) cover:^(BOOL finished) {
            [tableView beginUpdates];
            [tableView endUpdates];
        }];
    } else {
        _expandedIndex = indexPath.row;
        for (int i=0;i<5;i++) {
            [((UITableViewCell<CustomUITableViewCell> *)[self.tbl cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]) cover:nil];
        }
        [CATransaction begin];
        
        [CATransaction setCompletionBlock:^{
            if (_expandedIndex != -1) {
                [((UITableViewCell<CustomUITableViewCell> *)[tableView cellForRowAtIndexPath:indexPath]) uncover:nil];
            }
        }];
        
        [tableView beginUpdates];
        [tableView endUpdates];
        
        [CATransaction commit];
    }
    
}

@end
