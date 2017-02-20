//
//  PartyTableViewCell.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/13/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "PartyTableViewCell.h"

@interface PartyTableViewCell()

@property (strong, nonatomic) IBOutlet UIImageView *imageLogo;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDateAndTime;


@end

@implementation PartyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellWithParty:(Party*)party {
    
    self.party = party;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:party.date];
    
    self.labelName.text = party.name;
    self.labelDateAndTime.text = [NSString stringWithFormat:@"Date: %@ %@ - %@", stringFromDate, party.timeStart, party.timeEnd];
    self.imageLogo.image = [UIImage imageNamed:[[Party getImageNamesFromArray] objectAtIndex:party.logoNumber]];
    
    
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.labelDateAndTime.text = nil;
    self.labelName.text = nil;
    self.imageLogo.image = nil;
    self.party = nil;
}

+ (NSString*)reuseIdentifier {
    return @"MyReuseTableCellIdentifier";
}
@end
