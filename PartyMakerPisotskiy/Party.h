//
//  Patry.h
//  PartyMakerPisotskiy
//
//  Created by Intern01 on 2/12/17.
//  Copyright © 2017 Intern01. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Party : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *timeStart;
@property (nonatomic, strong) NSString *timeEnd;
@property NSInteger logoNumber;
@property (nonatomic, strong) NSString *partyDescription;

+ (instancetype)partyWithName:(NSString*)name date:(NSDate *)date timeOfStart:(NSString *)timeStart timeOfEnd:(NSString*)timeEnd logoNumber:(NSInteger)logoNumber andDescription:(NSString*)partyDescription;

- (instancetype)initPartyWithName:(NSString*)name date:(NSDate *)date timeOfStart:(NSString *)timeStart timeOfEnd:(NSString*)timeEnd logoNumber:(NSInteger)logoNumber andDescription:(NSString*)partyDescription;

-(id)initWithCoder:(NSCoder *)aDecoder;
-(void)encodeWithCoder:(NSCoder *)aCoder;

+ (NSMutableArray*)deserializePartyList;
+ (void) serializePartyList :(NSMutableArray*) partyList;

+ (NSArray*)getImageNamesFromArray;

@end
