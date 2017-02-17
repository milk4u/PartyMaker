//
//  PartyInfoViewController.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/17/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "PartyInfoViewController.h"

@interface PartyInfoViewController ()

// buttons
@property (weak, nonatomic) IBOutlet UIButton* buttonLocation;
@property (weak, nonatomic) IBOutlet UIButton* buttonEdit;
@property (weak, nonatomic) IBOutlet UIButton* buttonDelete;

// labels
@property (weak, nonatomic) IBOutlet UILabel* labelDate;
@property (weak, nonatomic) IBOutlet UILabel* labelStart;
@property (weak, nonatomic) IBOutlet UILabel* labelEnd;
@property (weak, nonatomic) IBOutlet UILabel* labelDescription;
@property (weak, nonatomic) IBOutlet UILabel* labelPartyName;

// image
@property (weak, nonatomic) IBOutlet UIImageView *imagePartyLogo;


@end

@implementation PartyInfoViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// buttons
- (IBAction)onButtonLocationTap:(id)sender {
}

- (IBAction)onButtonEditTap:(id)sender {
}

- (IBAction)onButtonDeleteTap:(id)sender {
}

@end
