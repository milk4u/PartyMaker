//
//  PMRPartyManagedObject+CoreDataProperties.h
//  
//
//  Created by Intern01 on 2/20/17.
//
//

#import "PMRPartyManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PMRPartyManagedObject (CoreDataProperties)

@property (nullable, nonatomic, copy) NSString *partyID;
@property (nullable, nonatomic, copy) NSDate *startDate;
@property (nullable, nonatomic, copy) NSDate *endDate;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *logoImageName;
@property (nullable, nonatomic, copy) NSString *descriptionText;
@property (nullable, nonatomic, copy) NSDate *creationDate;
@property (nullable, nonatomic, copy) NSDate *modoficationDate;
@property (nullable, nonatomic, copy) NSString *creatorID;
@property (nullable, nonatomic, copy) NSString *latitude;
@property (nullable, nonatomic, copy) NSString *longitude;

@end

NS_ASSUME_NONNULL_END
