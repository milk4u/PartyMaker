//
//  PartyTableViewCell.h
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/13/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Party.h"

@interface PartyTableViewCell : UITableViewCell

@property Party *party;

- (void)configureCellWithParty:(Party*)party;
+ (NSString*)reuseIdentifier;

@end
