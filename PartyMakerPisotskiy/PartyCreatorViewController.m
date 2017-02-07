//
//  PartyCreatorViewController.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/6/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "PartyCreatorViewController.h"
#import "ViewController.h"
#import "UIColor+Utilty.h"


@interface PartyCreatorViewController () <UITextViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>

@property UIView *mainView;
@property UISlider *sliderUp;
@property UISlider *sliderDown;
@property UILabel *upSliderLabel;
@property UILabel *downSliderLabel;
@property UIView *datePickerView;
@property UIDatePicker *datePicker;
@property UIButton *buttonChooseDay;
@property UITextField *textField;
@property UIScrollView *scrollView;
@property UIPageControl *pageControl;
@property UITextView *textView;
@property UIView *circle;

@end

@implementation PartyCreatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor viewBackgroundColor];
    self.title = @"Create Party";
    self.navigationItem.hidesBackButton = YES;
    [self SetUpUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)SetUpUI {
    [self SetUpNavigationBar];
    [self SetUpMainView];
}

- (void)SetUpMainView {
    self.mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.mainView.backgroundColor = [UIColor clearColor];
    
    NSInteger radius = 7;
    self.circle = [[UIView alloc] initWithFrame:CGRectMake(8, 83.6, 2 * radius, 2 * radius)];
    [self.circle setBackgroundColor:[UIColor whiteColor]];
    [self.circle setAlpha:0.5f];
    self.circle.layer.cornerRadius = radius;
    
    [self.mainView addSubview:self.circle];
    
    //ChoseDayButton
    self.buttonChooseDay = [[UIButton alloc] initWithFrame:CGRectMake(119.5f, 72.5f, 190, 36)];
    self.buttonChooseDay.backgroundColor = [UIColor dateButtonColor];
    [self.buttonChooseDay.layer setCornerRadius:5.4f];
    [self.buttonChooseDay setTitle:@"CHOOSE DATE" forState:UIControlStateNormal];
    [self.mainView addSubview:self.buttonChooseDay];
    
    [self.buttonChooseDay addTarget:self action:@selector(onButtonChooseDayClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //TextField
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(119.5, 119.5, 190, 36)];
    self.textField.placeholder = @"Your Party Name";
    self.textField.textColor = [UIColor whiteColor];
    self.textField.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.textField.backgroundColor = [UIColor descriptionRoundRectangleColor];
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Your party name" attributes:@{NSForegroundColorAttributeName: [UIColor placeholderTextColor]}];
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.delegate = self;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.textField.layer setCornerRadius:5.4f];
    //[textField addTarget:self action:@selector(onTextFieldEditingEnded) forControlEvents:UIControlEventEditingDidEnd];

    
    [self.mainView addSubview:self.textField];
    
    //SLIDERS
    
    //UpSlider VIEW
    UIView *sliderUpView = [[UIView alloc] initWithFrame:CGRectMake(119.5f, 170.5f, 190, 31)];
    
    //UpSlider
    self.sliderUp = [[UISlider alloc] initWithFrame:CGRectMake(55, 0, 135, 31)];
    self.sliderUp.maximumTrackTintColor = [UIColor slideBarMaximumTrackTintColor];
    self.sliderUp.thumbTintColor = [UIColor whiteColor];
    self.sliderUp.tintColor = [UIColor slideBarTintColor];
    self.sliderUp.minimumValue = 0;
    self.sliderUp.maximumValue = 23 * 60 + 29;
    
    //UpSlider Label
    self.upSliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 10, 30, 10)];
    [self.upSliderLabel setText:@"00:00"];
    [self.upSliderLabel setTextColor:[UIColor whiteColor]];
    [self.upSliderLabel setFont: [UIFont systemFontOfSize:9]];
    
    //UpSlider image
    UIImageView *sliderUpImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftSliderImg.png"]];
    [sliderUpImage setFrame:CGRectMake(0, 0, 45, 31)];
    [sliderUpImage addSubview:self.upSliderLabel];
    
    [self.sliderUp addTarget:self action:@selector(onUpSliderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    [sliderUpView addSubview:sliderUpImage];
    [sliderUpView addSubview:self.sliderUp];
    [self.mainView addSubview:sliderUpView];
    
    //DownSlider VIEW
    UIView *sliderDownView = [[UIView alloc] initWithFrame:CGRectMake(119.5f, 213, 190, 31)];
    
    //DownSlider Label
    self.downSliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 10, 30, 10)];
    [self.downSliderLabel setText:@"00:30"];
    [self.downSliderLabel setTextColor:[UIColor whiteColor]];
    [self.downSliderLabel setFont: [UIFont systemFontOfSize:9]];
    
    // Add DownSlider image
    UIImageView *sliderDownImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightSliderImg.png"]];
    [sliderDownImage setFrame:CGRectMake(149.5, 0, 40.5, 31)];
    [sliderDownImage addSubview:self.downSliderLabel];
    
    // Add DownSlider
    self.sliderDown = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 139.5f, 31)];
    self.sliderDown.maximumTrackTintColor = [UIColor slideBarMaximumTrackTintColor];
    self.sliderDown.thumbTintColor = [UIColor whiteColor];
    self.sliderDown.tintColor = [UIColor slideBarTintColor];
    self.sliderDown.minimumValue = 30;
    self.sliderDown.maximumValue = 24 * 60 - 1;
    
    [self.sliderDown addTarget:self action:@selector(onDownSliderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    [sliderDownView addSubview:sliderDownImage];
    [sliderDownView addSubview:self.sliderDown];
    [self.mainView addSubview:sliderDownView];
    
    //PAGE CONTROL VIEW
    [self.mainView addSubview:[self getPageControlView]];
    
    [self.mainView addSubview:[self getDescriptionView]];
    
    //Add button save
    UIButton *buttonSave = [[UIButton alloc] initWithFrame:CGRectMake(119.5f, 477, 190, 36)];
    buttonSave.backgroundColor = [UIColor saveButtonColor];
    [buttonSave.layer setCornerRadius:5.4f];
    [buttonSave setTitle:@"SAVE" forState:UIControlStateNormal];
    [self.mainView addSubview:buttonSave];
    [buttonSave addTarget:self action:@selector(onButtonSaveClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //dd button cancel
    UIButton *buttonCancel = [[UIButton alloc] initWithFrame:CGRectMake(119.5f, 524, 190, 36)];
    buttonCancel.backgroundColor = [UIColor cancelButtonColor];
    [buttonCancel.layer setCornerRadius:5.4f];
    [buttonCancel setTitle:@"CANCEL" forState:UIControlStateNormal];
    [self.mainView addSubview:buttonCancel];
    [buttonCancel addTarget:self action:@selector(onButtonCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // Add Lables
    [self.mainView addSubview:[self getLabelWithString:@"CHOOSE DAY" OY:90.6]];
    [self.mainView addSubview:[self getLabelWithString:@"PARTY NAME" OY:140]];
    [self.mainView addSubview:[self getLabelWithString:@"START" OY:186]];
    [self.mainView addSubview:[self getLabelWithString:@"END" OY:227]];
    [self.mainView addSubview:[self getLabelWithString:@"LOGO" OY:308]];
    [self.mainView addSubview:[self getLabelWithString:@"DESCRIPTION" OY:412]];
    [self.mainView addSubview:[self getLabelWithString:@"FINAL" OY:543]];
    
    //Add LINE
    UIView *verticalLine = [[UIView alloc] initWithFrame:CGRectMake(14, 90.6f, 2, 453)];
    [verticalLine setBackgroundColor:[UIColor littleDotColor]];
    [self.mainView addSubview:verticalLine];
    
    //Add Circle
    [self.mainView addSubview:[self getCircleViewWithOY:90.6]];
    [self.mainView addSubview:[self getCircleViewWithOY:140]];
    [self.mainView addSubview:[self getCircleViewWithOY:186]];
    [self.mainView addSubview:[self getCircleViewWithOY:227]];
    [self.mainView addSubview:[self getCircleViewWithOY:308]];
    [self.mainView addSubview:[self getCircleViewWithOY:412]];
    [self.mainView addSubview:[self getCircleViewWithOY:543]];
    
    [self.view addSubview:self.mainView];
}

- (void) moveCircleOnPositionOY: (NSInteger) y {
    [UIView animateWithDuration:0.5f animations:^{
        [self.circle setFrame:CGRectMake(8, y - 7, 14, 14)];
    }];
}

    - (void)onButtonChooseDayClicked:(UIButton*)sender {
    //DatePicker
        [self moveCircleOnPositionOY:90.6];
    if ([self.textView isFirstResponder]) {
        [self.textView resignFirstResponder];
    }
    if ([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
    //View
    self.datePickerView = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 320, 248)];
    
    //datePicker
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 40, 320, 208)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.datePicker setBackgroundColor:[UIColor whiteColor]];
    
    //toolbar for datePicker
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [toolbar setBarTintColor:[UIColor logoBackColor]];
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onDatePickerCancel:)];
    [cancelItem setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(onDatePickerDone:)];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [doneItem setTintColor:[UIColor whiteColor]];
    
    toolbar.items = @[cancelItem, flexibleSpace, doneItem];
    
    [self.datePickerView addSubview:self.datePicker];
    [self.datePickerView addSubview:toolbar];
    
    [self.mainView addSubview:self.datePickerView];
}

- (void)onDatePickerCancel:(UIBarButtonItem*)sender {
    [self.datePickerView removeFromSuperview];
}

- (void)onDatePickerDone:(UIBarButtonItem*)sender {
    [self.buttonChooseDay setTitle:[self formattedStringFromDate:self.datePicker.date] forState:UIControlStateNormal];
    [self onDatePickerCancel:sender];
}

- (void)onUpSliderValueChange:(UISlider*)sender {
    [self moveCircleOnPositionOY:186];
    if (sender.value > self.sliderDown.value - 30) {
        [self.sliderDown setValue:sender.value + 30 animated:YES];
        self.downSliderLabel.text = [self getTimeStringForSliderLabel:self.sliderDown.value];
    }
    self.upSliderLabel.text = [self getTimeStringForSliderLabel:sender.value];
}

- (void)onDownSliderValueChange:(UISlider*)sender {
    [self moveCircleOnPositionOY:227];
    if (sender.value < self.sliderUp.value + 30) {
        [self.sliderUp setValue:self.sliderDown.value - 30 animated:YES];
        self.upSliderLabel.text = [self getTimeStringForSliderLabel:self.sliderUp.value];
    }
    self.downSliderLabel.text = [self getTimeStringForSliderLabel:sender.value];
    
}

- (NSString*)getTimeStringForSliderLabel:(int)sliderValue {
    int hours = sliderValue / 60;
    int minutes = sliderValue % 60;
    
    NSString *stringHours = [NSString stringWithFormat:@"%i", hours];
    if (hours < 10) {
        stringHours = [NSString stringWithFormat:@"0%i", hours];
    }
    
    NSString *stringMinutes = [NSString stringWithFormat:@"%i", minutes];
    if (minutes < 10) {
        stringMinutes = [NSString stringWithFormat:@"0%i", minutes];
    }
    
    NSString *time = [NSString stringWithFormat:@"%@:%@", stringHours, stringMinutes];
    return time;
}

- (void)SetUpNavigationBar {
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(ReturnHome)];
    self.navigationItem.leftBarButtonItem = cancel;
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(SaveParty)];
    self.navigationItem.rightBarButtonItem = save;
}

- (NSString *)formattedStringFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd.MM.yyyy";
    
    return [formatter stringFromDate:date];
}

- (void)onButtonCancelClicked:(UIButton*)sender {
    [self ReturnHome];
}

- (void)onButtonSaveClicked:(UIButton*)sender {
    [self moveCircleOnPositionOY:543];
    [self checkIfAllRequiredFieldsEntered];
    //do something...
}

- (void)checkIfAllRequiredFieldsEntered {
    if ([self.buttonChooseDay.currentTitle isEqualToString:@"CHOOSE DATE"]) {
        [self presentAlertWithTitle:@"ERROR!" message:@"You should choose date of party!" needPopToRoot:NO];
    } else if (!self.textField.text.length) {
        [self presentAlertWithTitle:@"ERROR!" message:@"You should enter the party name!" needPopToRoot:NO];
    } else {
        [self presentAlertWithTitle:@"SUCCESS!" message:@"New party created!" needPopToRoot:YES];
    }
    
}

- (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message needPopToRoot:(BOOL)needPopToRoot {
    __block __weak PartyCreatorViewController *weakSelf = self;
    __block UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (needPopToRoot) {
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)SaveParty {
    //do somethings...
}

- (void)ReturnHome {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (UIView*)getLabelWithString:(NSString*)text OY:(float)y {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(28.5f, y - 10, 91, 20)];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:text];
    [label setFont:[UIFont systemFontOfSize: 10]];
    
    return label;
}

- (UIView*)getCircleViewWithOY:(float)y {
    int circleRadius = 5;
    UIView *circleView = [[UIView alloc] initWithFrame:CGRectMake(15 - circleRadius, y - circleRadius, 2 * circleRadius, 2 * circleRadius)];
    [circleView setBackgroundColor:[UIColor littleDotColor]];
    circleView.layer.cornerRadius = circleRadius;
    
    return circleView;
}


- (UIView*)getPageControlView {
    UIView *viewContainer = [[UIView alloc] initWithFrame:CGRectMake(119.5f, 255, 190, 100)];
    //[viewContainer setBackgroundColor:[[UIColor alloc] initWithRed:1 green:1 blue:1 alpha:0]];

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 190, 100)];
    self.scrollView.contentSize = (CGSize) {self.scrollView.frame.size.width * 6, self.scrollView.frame.size.height};
    [self.scrollView setBackgroundColor:[UIColor logoBackColor]];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;

    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1240, 100)];
    
    UIImageView *noAlcohol = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"No Alcohol.png"]];
    noAlcohol.frame = (CGRect){65, 20, 60, 50};
    [content addSubview:noAlcohol];
    
    UIImageView *coconutCocktail = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Coconut Cocktail.png"]];
    coconutCocktail.frame = (CGRect){255, 20, 60, 50};
    [content addSubview:coconutCocktail];
    
    UIImageView *christmasTree = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Christmas Tree.png"]];
    christmasTree.frame = (CGRect){445, 20, 60, 50};
    [content addSubview:christmasTree];
    
    UIImageView *champagne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Champagne.png"]];
    champagne.frame = (CGRect){635, 20, 60, 50};
    [content addSubview:champagne];
    
    UIImageView *birthdayCake = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Birthday Cake.png"]];
    birthdayCake.frame = (CGRect){825, 20, 60, 50};
    [content addSubview:birthdayCake];
    
    UIImageView *beer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Beer.png"]];
    beer.frame = (CGRect){1015, 20, 60, 50};
    [content addSubview:beer];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(45, 80, 100, 10)];
    self.pageControl.numberOfPages = 6;
    self.pageControl.currentPage = 0;
    
    [self.pageControl addTarget:self action:@selector(pageControlOnValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.scrollView addSubview:content];
    
    [viewContainer addSubview:self.scrollView];
    [viewContainer addSubview:self.pageControl];
    
    return viewContainer;
}

- (UIView*) getDescriptionView {
    UIView *descriptionView = [[UIView alloc] initWithFrame:CGRectMake(119.5f, 366.5, 190, 100)];
    
    UIView *greenSubView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 190, 5.5)];
    [greenSubView setBackgroundColor:[UIColor greenColorView]];
    
    // set up the description view
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 5.5, 190, 94.5)];
    [self.textView setBackgroundColor:[[UIColor alloc] initWithRed:29/255.f green:31/255.f blue:36/255.f alpha:1.f]];
    [self.textView setTextColor:[UIColor whiteColor]];
    
    self.textView.delegate = self;
    
    [descriptionView addSubview:greenSubView];
    [descriptionView addSubview:self.textView];
    
    // TOOLBAR
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [toolbar setBarTintColor:[UIColor logoBackColor]];
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelTap:)];
    [cancelItem setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(onDoneTap:)];
    [doneItem setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolbar.items = @[cancelItem, flexibleSpace, doneItem];
    self.textView.inputAccessoryView = toolbar;
    
    return descriptionView;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)onCancelTap:(UIBarButtonItem *)sender {
    if ([self.textView isFirstResponder]) {
        [self.textView resignFirstResponder];
    } else {
        [self.datePickerView removeFromSuperview];
    }
    self.textView.text = @"";
}

- (void)onDoneTap:(UIBarButtonItem *)sender {
    if ([self.textView isFirstResponder]) {
        [self.textView resignFirstResponder];
    } else {
        [self.datePickerView removeFromSuperview];
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    [self moveCircleOnPositionOY:412];
    
    return YES;
}

- (void) pageControlOnValueChanged:(UIPageControl*)sender {
    [self moveCircleOnPositionOY:308];
    CGPoint contentOffset = CGPointMake(sender.currentPage * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:contentOffset animated:YES];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView*)scrollView {
    [self moveCircleOnPositionOY:308];
    NSInteger currentPage = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    [self.pageControl setCurrentPage:currentPage];
}

- (void)keyboardWillShow:(NSNotification*)notification {
    if ([self.textView isFirstResponder]) {
        CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        float duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        
        __block __weak PartyCreatorViewController *weakSelf = self;
        [UIView animateWithDuration:duration animations:^{
            CGRect viewFrame = weakSelf.mainView.frame;
            viewFrame.origin.y -= keyboardRect.size.height;
            weakSelf.mainView.frame = viewFrame;
        }];
    }
}

-(void)keyboardWillHide:(NSNotification*)notification {
    float duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    __block __weak PartyCreatorViewController *weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        CGRect viewFrame = weakSelf.mainView.frame;
        viewFrame.origin.y = 0;
        weakSelf.mainView.frame = viewFrame;
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self moveCircleOnPositionOY:140];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
