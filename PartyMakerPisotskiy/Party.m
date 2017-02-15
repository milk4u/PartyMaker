//
//  Patry.m
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/12/17.
//  Copyright © 2017 Intern01. All rights reserved.
//

#import "Party.h"

@implementation Party

+ (instancetype) partyWithName:(NSString*)name date:(NSDate *)date timeOfStart:(NSString *)timeStart timeOfEnd:(NSString*)timeEnd logoNumber:(NSInteger)logoNumber andDescription:(NSString*)partyDescription {
    return [[self alloc] initPartyWithName:(NSString*)name date:(NSDate *)date timeOfStart:(NSString *)timeStart timeOfEnd:(NSString*)timeEnd logoNumber:(NSInteger)logoNumber andDescription:(NSString*)partyDescription ];
}

- (instancetype) initPartyWithName:(NSString*)name date:(NSDate *)date timeOfStart:(NSString *)timeStart timeOfEnd:(NSString*)timeEnd logoNumber:(NSInteger)logoNumber andDescription:(NSString*)partyDescription {
    
    self = [super init];
    
    self.name = name;
    self.date = date;
    self.timeStart = timeStart;
    self.timeEnd = timeEnd;
    self.logoNumber = logoNumber;
    self.partyDescription = partyDescription;
    
    return self;
}

-(void)encodeWithCoder:(NSCoder*)aCoder {
    [aCoder encodeObject:self.name forKey:@"partyName"];
    [aCoder encodeObject:self.date forKey:@"partyDate"];
    [aCoder encodeObject:self.timeStart forKey:@"partyTimeOfStart"];
    [aCoder encodeObject:self.timeEnd forKey:@"partyTimeOfEnd"];
    [aCoder encodeInteger:self.logoNumber forKey:@"partyLogoNumber"];
    [aCoder encodeObject:self.partyDescription forKey:@"partyDescription"];
}

-(id)initWithCoder:(NSCoder*)aDecoder {
    self.name = [aDecoder decodeObjectForKey:@"partyName"];
    self.date = [aDecoder decodeObjectForKey:@"partyDate"];
    self.timeStart = [aDecoder decodeObjectForKey:@"partyTimeOfStart"];
    self.timeEnd = [aDecoder decodeObjectForKey:@"partyTimeOfEnd"];
    self.logoNumber = [aDecoder decodeIntegerForKey:@"partyLogoNumber"];
    self.partyDescription = [aDecoder decodeObjectForKey:@"partyDescription"];
    
    return self;
}

+ (NSMutableArray*)deserializePartyList {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"partyList"];
    NSMutableArray *partyList;
    
    if (!data) {
        partyList = [[NSMutableArray alloc] init];
    } else {
        partyList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    return partyList;
}

+ (void)serializePartyList:(NSMutableArray*)partyList {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:partyList];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"partyList"];
}

+ (NSArray*)getImageNamesFromArray {
    NSArray *imageNamesArray = @[@"No Alcohol.png", @"Coconut Cocktail.png", @"Christmas Tree.png", @"Champagne.png", @"Birthday Cake.png", @"Beer.png"];
    
    return imageNamesArray;
}

@end

