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

- (void)configureCellWithPartyName:(NSString*)name date:(NSDate*)date timeOfStart:(NSString*)timeStart timeOfEnd:(NSString*)timeEnd andNumberOfLogo:(NSInteger)number;
+ (NSString*)reuseIdentifier;

@end
