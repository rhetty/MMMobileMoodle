//
//  UIImage+iphone6.m
//  Wandant
//
//  Created by laker hoo on 15/9/8.
//  Copyright © 2015年 fnst. All rights reserved.
//

#import "UIImage+iphone6.h"
#import <objc/runtime.h>

@implementation UIImage (iphone6)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(imageNamed:);
        SEL swizzledSelector = @selector(six_imageNamed:);
        
        Method originalMethod = class_getClassMethod(class, originalSelector);
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
    
    

}


+ (UIImage *)six_imageNamed:(NSString *)name{
    if ([UIScreen mainScreen].bounds.size.width == 375) {
        UIImage *image = [UIImage six_imageNamed:[NSString stringWithFormat:@"%@_6",name]];
        if (image) {
            name = [NSString stringWithFormat:@"%@_6",name];
        }
    }
    return [UIImage six_imageNamed:name];
}


@end
