//
//  PartyTableViewController.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/13/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "PartyTableViewController.h"

@interface PartyTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewPartyList;

@end

@implementation PartyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //clear underlines
    self.tableViewPartyList.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PartyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PartyTableViewCell reuseIdentifier]];
    
    if (!cell) {
        cell = [[PartyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[PartyTableViewCell reuseIdentifier]];
    }
    
    Party *party = [[Party deserializePartyList] objectAtIndex:indexPath.row];
    
    [cell configureCellWithPartyName:(NSString*)party.name date:(NSDate*)party.date timeOfStart:(NSString*)party.timeStart timeOfEnd:(NSString*)party.timeEnd andNumberOfLgog:(NSInteger)party.logoNumber];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Party deserializePartyList].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height / 10;
}

@end
