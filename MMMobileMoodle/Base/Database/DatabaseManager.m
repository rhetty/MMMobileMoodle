
#import "DatabaseManager.h"

@implementation DatabaseManager

+ (id)fetchResultWithEntityName:(NSString *)name withPredicate:(NSPredicate *)predicate order:(NSArray *)orders managedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:name inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    if(predicate){
        [fetchRequest setPredicate:predicate];
    }
    if (orders) {
        [fetchRequest setSortDescriptors:orders];
    }
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        return  nil;
    } else {
        return result;
    }
}

+ (id)createEntityName:(NSString *)name managedObjectContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:context];
}

+ (void)deleteModel:(id)model managedObjectContext:(NSManagedObjectContext *)context
{
    if(!model)
        return;
    [context deleteObject:model];
}

+ (void)refresh:(NSManagedObjectContext *)context
{
    [context refreshAllObjects];
}


@end
