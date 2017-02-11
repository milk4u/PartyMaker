//
//  XibViewController.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/9/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "UIColor+Utilty.h"
#import "XibViewController.h"

@interface XibViewController () <UITextFieldDelegate, UIScrollViewDelegate, UITextViewDelegate>
//buttonUI
@property (weak, nonatomic) IBOutlet UIButton* buttonChooseDay;

//sliderUI
@property (weak, nonatomic) IBOutlet UISlider* sliderStart;
@property (weak, nonatomic) IBOutlet UISlider* sliderEnd;

//labelUI
@property (weak, nonatomic) IBOutlet UILabel* labelStart;
@property (weak, nonatomic) IBOutlet UILabel* labelEnd;

//textUI
@property (weak, nonatomic) IBOutlet UITextField* textField;
@property (weak, nonatomic) IBOutlet UITextView* textView;

//datePickerUI
@property (weak, nonatomic) IBOutlet UIDatePicker* datePicker;
@property (weak, nonatomic) IBOutlet UIView* datePickerView;

//otherUI
@property (weak, nonatomic) IBOutlet UIScrollView* scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl* pageControl;
@property (weak, nonatomic) IBOutlet UIView* movableCircle;
@property (strong, atomic) IBOutlet UIToolbar* toolbarForDescription;

//Not outlet
@property NSString* previousDescriptionValue;
@property BOOL isDatePicked;
@property BOOL isNamePicked;

@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Create Party";
    self.navigationItem.hidesBackButton = YES;
    
    [self setUpDatePicker];
    [self setUpTextField];
    [self setUpScrollView];
    [self setUpTextView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setUpDatePicker {
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.minimumDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
}

- (void)setUpTextField {
    self.textField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"Your party name" attributes:@{NSForegroundColorAttributeName: [UIColor placeholderTextColor]}];
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.delegate = self;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (void)setUpScrollView {
    self.scrollView.contentSize = (CGSize) {self.scrollView.frame.size.width * 6, self.scrollView.frame.size.height};
}

- (void)setUpTextView {
    self.textView.inputAccessoryView = self.toolbarForDescription;
    self.textView.text = @"";
    self.previousDescriptionValue = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonChooseDayTap:(UIButton*)sender {
    self.datePickerView.hidden = NO;
    [UIView animateWithDuration:0.3f animations:^{
        self.datePickerView.frame = (CGRect){0, 295, self.datePickerView.frame.size.width, self.datePickerView.frame.size.height};
    }];
    [self moveFocusCircleOnY:27.6];
}

- (IBAction)onChooseDayToolbarCancelTap:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        self.datePickerView.frame = (CGRect){0, 570, self.datePickerView.frame.size.width, self.datePickerView.frame.size.height};
    self.datePickerView.hidden = YES;
    }];
}

- (IBAction)onChoodeDayToolbarDoneTap:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    
    NSString *stringFromDate = [dateFormatter stringFromDate:self.datePicker.date];
    [self.buttonChooseDay setTitle:stringFromDate forState:UIControlStateNormal];
    
    self.isDatePicked = YES;
    [self onChooseDayToolbarCancelTap: nil];
}

- (IBAction)onSliderStartValueChanged:(UISlider*)sender {
    if (sender.value > self.sliderEnd.value - 30) {
        [self.sliderEnd setValue:sender.value + 30 animated:YES];
        self.labelEnd.text = [self getTimeStringFromSliderValue:self.sliderEnd.value];
    }
    self.labelStart.text = [self getTimeStringFromSliderValue:sender.value];
    [self moveFocusCircleOnY:122];
}

- (IBAction)onSliderEndValueChanged:(UISlider*)sender {
    if (sender.value < self.sliderStart.value + 30) {
        [self.sliderStart setValue:self.sliderEnd.value - 30 animated:YES];
        self.labelStart.text = [self getTimeStringFromSliderValue:self.sliderStart.value];
    }
    self.labelEnd.text = [self getTimeStringFromSliderValue:sender.value];
    [self moveFocusCircleOnY:163];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self moveFocusCircleOnY:76];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    self.isNamePicked = YES;
    return YES;
}

- (IBAction)onPageControlValueChanged:(UIPageControl*)sender {
    CGPoint contentOffset = CGPointMake(self.pageControl.currentPage * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:contentOffset animated:YES];

    [self moveFocusCircleOnY:244];
}

- (void) scrollViewDidEndDecelerating: (UIScrollView*) scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    [self.pageControl setCurrentPage:currentPage];
    
    [self moveFocusCircleOnY:244];
}

- (IBAction)onDescriptionViewToolbarCancel:(id)sender {
    [self textViewShouldEndEditing:self.textView];
    
    [self.textView setText:self.previousDescriptionValue];
}

- (IBAction)onDescriptionViewToolbarDone:(id)sender {
    [self textViewShouldEndEditing:self.textView];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    self.previousDescriptionValue = self.textView.text;
    [self moveFocusCircleOnY:358];
    
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
    return YES;
}

- (IBAction)onSaveItemTap:(id)sender {
    [self checkIfAllRequiredFieldsEntered];
}

- (IBAction)onCancelItemTap:(id)sender {
    [self loadView];
    [self viewDidLoad];
    //[self viewWillAppear:NO];
}

- (void)keyboardWillShow:(NSNotification*)notification {
    if ([self.textView isFirstResponder]) {
        CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        float duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        
        __block __weak XibViewController *weakSelf = self;
        [UIView animateWithDuration:duration animations:^{
            CGRect viewFrame = weakSelf.view.frame;
            viewFrame.origin.y -= keyboardRect.size.height;
            weakSelf.view.frame = viewFrame;
        }];
    }
}

-(void)keyboardWillHide:(NSNotification*)notification {
    float duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    __block __weak XibViewController *weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        CGRect viewFrame = weakSelf.view.frame;
        viewFrame.origin.y = 0;
        weakSelf.view.frame = viewFrame;
    }];
}

//tools

- (NSString*)getTimeStringFromSliderValue:(int)sliderValue {
    int hours = sliderValue / 60;
    int minutes = sliderValue % 60;
    
    return [NSString stringWithFormat:@"%02i:%02i", hours, minutes];
}

- (void)checkIfAllRequiredFieldsEntered {
    if (!self.isDatePicked) {
        [self presentAlertWithTitle:@"ERROR!" message:@"Please, choose date of party!" needPopToRoot:NO];
        [self moveFocusCircleOnY:27.6];
    } else if (!self.isNamePicked) {
        [self presentAlertWithTitle:@"ERROR!" message:@"Please, enter the party name!" needPopToRoot:NO];
        [self moveFocusCircleOnY:76];
    } else {
        [self presentAlertWithTitle:@"SUCCESS!" message:@"New party successfully created!" needPopToRoot:YES];
        [self moveFocusCircleOnY:477];
    }
    
}

- (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message needPopToRoot:(BOOL)needPopToRoot {
    __block __weak XibViewController *weakSelf = self;
    __block UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (needPopToRoot) {
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void) moveFocusCircleOnY: (NSInteger) y {
    [UIView animateWithDuration:0.5f animations:^{
        [self.movableCircle setFrame:CGRectMake(self.movableCircle.frame.origin.x, y - 7, self.movableCircle.frame.size.height, self.movableCircle.frame.size.width)];
    }];
}

@end
