//
//  CALayer+XibConfiguration.m
//  mycloud.mapmark
//
//  Created by huhk.fnst@g08 on 15/7/16.
//  Copyright © 2015年 fujitsu. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer (XibConfiguration)

-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}


-(void)setShadowUIColor:(UIColor*)color
{
    self.shadowColor = color.CGColor;
}

-(UIColor*)shadowUIColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}
@end
