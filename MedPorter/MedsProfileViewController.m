//
//  MedsProfileViewController.m
//  MedPorter
//
//  Created by dev on 6/25/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "MedsProfileViewController.h"
#import "CustomUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface MedsProfileViewController ()

@property int expandedIndex;

@end

@implementation MedsProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:@"MedPorterProfileViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.btnMeds setUserInteractionEnabled:NO];
    [self.btnMeds setBackgroundColor:[UIColor colorWithRed:52.0/255.0 green:73.0/255.0 blue:94.0/255.0 alpha:1.0f]];
    
    _expandedIndex = -1;
    
    self.tbl.dataSource = self;
    self.tbl.delegate = self;
    [self.tbl registerNib:[UINib nibWithNibName:@"CurrentMedicationsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CurrentMedicationsCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"PastMedicationsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PastMedicationsCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"PharmacyUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PharmacyCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"VaccinationsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"VaccinationsCellIdentifier"];
    [self.tbl registerNib:[UINib nibWithNibName:@"SupplementsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SupplementsCellIdentifier"];
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
            cell = [tableView dequeueReusableCellWithIdentifier:@"CurrentMedicationsCellIdentifier"];
            [cell updateCellWithTitle:@"current medications"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PastMedicationsCellIdentifier"];
            [cell updateCellWithTitle:@"past medications"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PharmacyCellIdentifier"];
            [cell updateCellWithTitle:@"pharmacy"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"VaccinationsCellIdentifier"];
            [cell updateCellWithTitle:@"vaccinations"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"SupplementsCellIdentifier"];
            [cell updateCellWithTitle:@"supplements"];
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
