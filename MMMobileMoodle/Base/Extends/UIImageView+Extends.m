//
//  UIImageView+Extends.m
//  Wandant
//
//  Created by laker hoo on 15/10/12.
//  Copyright © 2015年 fnst. All rights reserved.
//

#import "UIImageView+Extends.h"
#import "UIImage+Extend.h"

@implementation UIImageView (Extends)



-(void)setBackgroundImageColor:(UIColor *)backgroundImageColor{
    self.image = [UIImage createImageWithColor:backgroundImageColor];
    
}

-(UIColor *)backgroundImageColor{
    return  self.backgroundImageColor;
}
@end
