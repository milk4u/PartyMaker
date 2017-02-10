//
//  ViewController.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 1/31/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "ViewController.h"
#import "XibViewController.h"
#import "UIColor+Utilty.h"

@interface ViewController ()

//@property (atomic, strong) XibViewController* xibViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Home";
    self.view.backgroundColor = [UIColor viewBackgroundColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIBarButtonItem *buttonCreateParty = [[UIBarButtonItem alloc] initWithTitle:@"Create Party" style:UIBarButtonItemStylePlain target:self action:@selector(CreateParty)];
    self.navigationItem.rightBarButtonItem = buttonCreateParty;
}

- (void)CreateParty {
    XibViewController *xibViewController = [[XibViewController alloc] initWithNibName:@"XibViewController" bundle:nil];
    
    [self.navigationController pushViewController:xibViewController animated:YES];
}
     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
