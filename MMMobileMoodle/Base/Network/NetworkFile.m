
#import "NetworkFile.h"
#import "MacroUtils.h"

@implementation NetworkFile

-(instancetype)init{
    self = [super init];
    if (self) {
        self.filePath = EMPTY_STRING;
        self.mineType = EMPTY_STRING;
    }
    return self;
}

@end
