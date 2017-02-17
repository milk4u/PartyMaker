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

- (void)configureCellWithPartyName:(NSString*)name date:(NSDate*)date timeOfStart:(NSString*)timeStart timeOfEnd:(NSString*)timeEnd andNumberOfLogo:(NSInteger)number {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    
    self.labelName.text = name;
    self.labelDateAndTime.text = [NSString stringWithFormat:@"Date: %@ %@ - %@", stringFromDate, timeStart, timeEnd];
    self.imageLogo.image = [UIImage imageNamed:[[Party getImageNamesFromArray] objectAtIndex:number]];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.labelDateAndTime.text = nil;
    self.labelName.text = nil;
    self.imageLogo.image = nil;
}

+ (NSString*)reuseIdentifier {
    return @"MyReuseTableCellIdentifier";
}
@end
