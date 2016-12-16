//
//  UITextField+PaddingText.m
//  mycloud.mapmark
//
//  Created by huhk.fnst@g08 on 15/7/16.
//  Copyright © 2015年 fujitsu. All rights reserved.
//

#import "UITextField+PaddingText.h"

@implementation UITextField (PaddingText)

-(void) setLeftPadding:(int) paddingValue
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, self.frame.size.height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void) setRightPadding:(int) paddingValue
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, self.frame.size.height)];
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
}

-(int)leftPadding{
    return self.leftView.frame.size.width;
}

-(int)rightPadding{
    return self.rightView.frame.size.width;
}

@end
