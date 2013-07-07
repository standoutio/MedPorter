//
//  MedicalProfileViewController.m
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "MedicalProfileViewController.h"
#import "CustomUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface MedicalProfileViewController ()

@property int expandedIndex;

@end

@implementation MedicalProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:@"MedPorterProfileViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.btnMedical setUserInteractionEnabled:NO];
    [self.btnMedical setBackgroundColor:[UIColor colorWithRed:52.0/255.0 green:73.0/255.0 blue:94.0/255.0 alpha:1.0f]];
    
    _expandedIndex = -1;
    
    self.tbl.dataSource = self;
    self.tbl.delegate = self;
    [self.tbl registerNib:[UINib nibWithNibName:@"AllergiesUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"AllergiesCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"CurrentConditionsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CurrentConditionsCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"PastConditionsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PastConditionsCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"SurgeriesUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SurgeriesCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"WomensHealthUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"WomensHealthCellIdentifier"];
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
            cell = [tableView dequeueReusableCellWithIdentifier:@"AllergiesCellIdentifier"];
            [cell updateCellWithTitle:@"allergies"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"CurrentConditionsCellIdentifier"];
            [cell updateCellWithTitle:@"current conditions"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PastConditionsCellIdentifier"];
            [cell updateCellWithTitle:@"past conditions"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"SurgeriesCellIdentifier"];
            [cell updateCellWithTitle:@"surgeries"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"WomensHealthCellIdentifier"];
            [cell updateCellWithTitle:@"women's health"];
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
