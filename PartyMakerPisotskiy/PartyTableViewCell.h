#import <UIKit/UIKit.h>
#import "Party.h"

@interface PartyTableViewCell : UITableViewCell

@property Party *party;

- (void)configureCellWithParty:(Party*)party;
+ (NSString*)reuseIdentifier;

@end
