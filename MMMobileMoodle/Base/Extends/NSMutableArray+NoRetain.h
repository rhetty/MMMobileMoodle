//
//  NSMutableArray+NoRetain.h
//  Wandant
//
//  Created by laker hoo on 15/9/28.
//  Copyright © 2015年 fnst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (NoRetain)


+ (id)mutableArrayUsingWeakReferences;


+ (id)mutableArrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity;
@end
