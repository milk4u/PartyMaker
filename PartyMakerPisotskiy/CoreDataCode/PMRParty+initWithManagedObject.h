#import "PMRParty.h"
@class PMRPartyManagedObject;

@interface PMRParty (initWithManagedObject)

- (instancetype)initWithManagedObject:(PMRPartyManagedObject*)managedObject;

@end
