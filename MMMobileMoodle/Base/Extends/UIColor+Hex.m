//
//  UIColor+Hex.m
//  YuanQing
//
//  Created by FNST）銭 宇傑 on 2015/03/12.
//  Copyright (c) 2015年 com.fujitsu. All rights reserved.
//

#import "UIColor+Hex.h"

#define Hexs  @[@"0x", @"0X"]

@implementation UIColor (Hex)

+ (UIColor*)colorWithHexString:(NSString*)colorString {
    CGFloat alpha,red,green,blue;
    
    NSString *substring = [colorString substringWithRange: NSMakeRange(0, 2)];
    if (colorString.length == 8 && [Hexs containsObject:substring] ) {
        alpha = 1.0f;
    } else {
        alpha=[self colorComponentFrom:colorString start:0 length:2];
    }
    red=[self colorComponentFrom:colorString start:2 length:2];
    green=[self colorComponentFrom:colorString start:4 length:2];
    blue=[self colorComponentFrom:colorString start:6 length:2];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorComponentFrom:(NSString*)string
                        start:(NSUInteger)start
                       length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0f;
}

@end
