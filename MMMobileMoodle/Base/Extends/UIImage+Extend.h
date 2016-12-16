//
//  UIImage+Extend.h
//  YuanQing
//
//  Created by huhk.fnst@g08 on 15/5/22.
//  Copyright (c) 2015年 com.fujitsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)


+ (UIImage *) createImageWithColor: (UIColor*)color;

- (UIImage *) imageScaledToSize: (CGSize)newSize;

+ (UIImage *) imageWithView: (UIView *)view;


@end
