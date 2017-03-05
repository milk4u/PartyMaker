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
@property (weak, nonatomic) IBOutlet UIView *logoBack;
@property (weak, nonatomic) IBOutlet UIView *logoFront;

@end

@implementation PartyInfoViewController

@synthesize party;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillLayoutSubviews {
	[self setUpImage];
}

//labels setup
- (void)setUpLabels {
    
    self.labelPartyName.text = party.name;
    self.labelDescription.text = party.partyDescription;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    self.labelDate.text = [dateFormatter stringFromDate:party.date];
    
    self.labelStart.text = party.timeStart;
    self.labelEnd.text = party.timeEnd;
    
}

- (void)setUpImage {
    [self.logoBack.layer setCornerRadius:(self.logoBack.frame.size.width/ 2)];
    [self.logoFront.layer setCornerRadius:(self.logoFront.frame.size.width / 2)];
    self.imagePartyLogo.image = [UIImage imageNamed:[[Party getImageNamesFromArray] objectAtIndex:party.logoNumber]];
}

// buttons
- (IBAction)onButtonLocationTap:(id)sender {
}

- (IBAction)onButtonEditTap:(id)sender {
}

- (IBAction)onButtonDeleteTap:(id)sender {
}

@end
