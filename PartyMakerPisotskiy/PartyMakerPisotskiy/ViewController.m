//
//  ViewController.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 1/31/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "ViewController.h"
#import "PartyCreatorViewController.h"
#import "UIColor+Utilty.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.title = @"Home";
    self.view.backgroundColor = [UIColor viewBackgroundColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.title = @"Home";
    self.view.backgroundColor = [UIColor viewBackgroundColor];
    
    UIBarButtonItem *buttonCreateParty = [[UIBarButtonItem alloc] initWithTitle:@"Create Party" style:UIBarButtonItemStylePlain target:self action:@selector(CreateParty)];
    self.navigationItem.rightBarButtonItem = buttonCreateParty;
}

- (void)CreateParty {
    PartyCreatorViewController *partyCreatorVC = [[PartyCreatorViewController alloc] init];
    partyCreatorVC.view = [[UIView alloc] initWithFrame:self.view.frame];
    
    [self.navigationController pushViewController:partyCreatorVC animated:YES];
}
     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
