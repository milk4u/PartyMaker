#import "PartyTableViewController.h"
#import "PartyInfoViewController.h"

@interface PartyTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewPartyList;
@property NSIndexPath *indexPath;

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PartyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PartyTableViewCell reuseIdentifier]];
    
    if (!cell) {
        cell = [[PartyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[PartyTableViewCell reuseIdentifier]];
    }
    
    Party *party = [[Party deserializePartyList] objectAtIndex:indexPath.row];
    
    [cell configureCellWithParty:party];
    
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
    return self.view.frame.size.height / 8;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"PartyInfoSegue"]) {
        PartyInfoViewController *partyInfoViewController = [segue destinationViewController];
        
        PartyTableViewCell *cell = (PartyTableViewCell*) sender;
        partyInfoViewController.party = cell.party;
    }
}

@end
