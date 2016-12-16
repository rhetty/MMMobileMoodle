
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DatabaseManager : NSObject

+ (id)fetchResultWithEntityName:(NSString *)name withPredicate:(NSPredicate *)predicate order:(NSArray *)orders managedObjectContext:(NSManagedObjectContext *)context;

@end
