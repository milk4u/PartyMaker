//
//  SaveViewController.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/15/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "SaveViewController.h"

@interface SaveViewController ()

@end

@implementation SaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeBarButtonTap:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[self performSegueWithIdentifier:@"modalSegueToHome" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
