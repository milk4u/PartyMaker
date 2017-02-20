//
//  PMRPartyManagedObject+CoreDataClass.h
//  
//
//  Created by Intern01 on 2/20/17.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface PMRPartyManagedObject : NSManagedObject

+ (PMRPartyManagedObject*)fetchPartyWithName:(NSString*)name inContext:(NSManagedObjectContext *)context;
+ (PMRPartyManagedObject*)createPartyWithName:(NSString*)name inContext:(NSManagedObjectContext *)context;

+ (PMRPartyManagedObject*)fetchPartyWithPartyID:(NSString*)partyID inContext:(NSManagedObjectContext *)context;
+ (PMRPartyManagedObject*)createPartyWithPartyID:(NSString*)partyID inContext:(NSManagedObjectContext *)context;

+ (NSArray<PMRPartyManagedObject *>*)fetchAllPartiesInContext:(NSManagedObjectContext *)context;
+ (NSArray<PMRPartyManagedObject *>*)fetchAllPartiesWithIDinContext:(NSManagedObjectContext *)context;
+ (NSArray<PMRPartyManagedObject *>*)fetchAllPartiesWithoutIDinContext:(NSManagedObjectContext *)context;


@end

NS_ASSUME_NONNULL_END

#import "PMRPartyManagedObject+CoreDataProperties.h"
