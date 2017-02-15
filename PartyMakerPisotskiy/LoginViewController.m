//
//  LoginViewController.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/15/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "LoginViewController.h"
#import "UIColor+CustomColors.h"

@interface LoginViewController () <UITextFieldDelegate>

//buttons
@property (weak, nonatomic) IBOutlet UIButton* buttonRegister;
@property (weak, nonatomic) IBOutlet UIButton* buttonLogin;

@property (weak, nonatomic) IBOutlet UITextField* textFieldLogin;
@property (weak, nonatomic) IBOutlet UITextField* textFieldPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTextField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUpTextField {
    //set up text field "login"
    self.textFieldLogin.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"Login" attributes:@{NSForegroundColorAttributeName: [UIColor placeholderTextColor]}];
    self.textFieldLogin.returnKeyType = UIReturnKeyDone;
    self.textFieldLogin.delegate = self;
    self.textFieldLogin.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //set up text field "password"
    self.textFieldPassword.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor placeholderTextColor]}];
    self.textFieldPassword.returnKeyType = UIReturnKeyDone;
    self.textFieldPassword.delegate = self;
    self.textFieldPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)onButtonRegisterTap:(id)sender {
    [self isAllFieldsEntered];
    //push information on server
    [self performSegueWithIdentifier:@"modalSegueToHome" sender:self];
}

- (IBAction)onButtonLoginTap:(id)sender {
    [self isAllFieldsEntered];
    //compare login/password with database
    //prepare list of parties
    //perform segue

}

// staff

- (void)isAllFieldsEntered {
    if ([self.textFieldLogin.text isEqualToString:@""]) {
        [self presentAlertWithTitle:@"ERROR!" message:@"Please, enter your login"];
    } else if ([self.textFieldPassword.text isEqualToString:@""]) {
        [self presentAlertWithTitle:@"ERROR!" message:@"Please, enter the password!"];
    }
}

- (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message {
    __block UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
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
