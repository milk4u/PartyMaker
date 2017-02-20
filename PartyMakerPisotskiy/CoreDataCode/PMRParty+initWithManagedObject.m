//
//  PMRParty+_initWithManagedObject.m
//  PartyMaker
//
//  Copyright © 2017 Softheme. All rights reserved.
//

#import "PMRParty+initWithManagedObject.h"
#import "PMRPartyManagedObject+CoreDataClass.h"

@implementation PMRParty (initWithManagedObject)

- (instancetype)initWithManagedObject:(PMRPartyManagedObject*)managedObject {
    
    return [self initWithPartyID:managedObject.partyID
                            name:managedObject.name
                       startDate:managedObject.startDate
                         endDate:managedObject.endDate
                   logoImageName:managedObject.logoImageName
                 descriptionText:managedObject.descriptionText
                    creationDate:managedObject.creationDate
                modificationDate:managedObject.modificationDate
                       creatorID:managedObject.creatorID
                        latitude:managedObject.latitude
                      longtitude:managedObject.longtitude];
}

@end
