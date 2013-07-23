//
//  ProfileViewController.m
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "ProfileViewController.h"
#import "CustomUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController ()

@property int expandedIndex;

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:@"MedPorterProfileViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.btnBasics setUserInteractionEnabled:NO];
    [self.btnBasics setBackgroundColor:[UIColor colorWithRed:52.0/255.0 green:73.0/255.0 blue:94.0/255.0 alpha:1.0f]];
    [self.btnBasics setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    _expandedIndex = -1;
    
    self.tbl.dataSource = self;
    self.tbl.delegate = self;
    [self.tbl registerNib:[UINib nibWithNibName:@"BackgroundUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BackgroundCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"InsuranceInfoUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"InsuranceInfoCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"EmailPhoneUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EmailPhoneCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"SocialUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SocialCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"EmergencyContactUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EmergencyContactCellIdentifier"];
    [self.tbl reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell<CustomUITableViewCell> *cell = nil;
    switch (indexPath.row) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"BackgroundCellIdentifier"];
            [cell updateCellWithTitle:@"background"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"InsuranceInfoCellIdentifier"];
            [cell updateCellWithTitle:@"insurance info"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EmailPhoneCellIdentifier"];
            [cell updateCellWithTitle:@"email & phone"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"SocialCellIdentifier"];
            [cell updateCellWithTitle:@"social"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EmergencyContactCellIdentifier"];
            [cell updateCellWithTitle:@"emergency contact"];
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
