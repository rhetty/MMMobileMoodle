//
//  NSMutableArray+NoRetain.m
//  Wandant
//
//  Created by laker hoo on 15/9/28.
//  Copyright © 2015年 fnst. All rights reserved.
//

#import "NSMutableArray+NoRetain.h"

@implementation NSMutableArray (NoRetain)

+ (id)mutableArrayUsingWeakReferences {
    return [self mutableArrayUsingWeakReferencesWithCapacity:0];
}

+ (id)mutableArrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity {
    CFArrayCallBacks callbacks = {0, NULL, NULL, CFCopyDescription, CFEqual};
    // We create a weak reference array
    return (id)CFBridgingRelease(CFArrayCreateMutable(0, capacity, &callbacks));
}
@end
