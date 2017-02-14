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

- (void)configureCellWithPartyName:(NSString*)name date:(NSDate*)date timeOfStart:(NSString*)timeStart timeOfEnd:(NSString*)timeEnd andNumberOfLgog:(NSInteger)number {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    
    self.labelName.text = name;
    self.labelDateAndTime.text = [NSString stringWithFormat:@"Dste: %@ %@ - %@", stringFromDate, timeStart, timeEnd];
    self.imageLogo.image = [UIImage imageNamed:[[Party getImageNamesFromArray] objectAtIndex:number]];
    
    /*
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [[UIColor alloc] initWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1.f];
    [self setSelectedBackgroundView:bgColorView];
     */
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.labelDateAndTime.text = nil;
    self.labelName.text = nil;
    self.imageLogo.image = nil;
}

+ (NSString*)reuseIdentifier {
    return @"MyReuseIdentifier";
}

/*
-(instancetype)init {
    self = [super init];
    
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = [UIColor redColor];
    [self setSelectedBackgroundView:selectedView];
    
    return self;
}
 */
@end
