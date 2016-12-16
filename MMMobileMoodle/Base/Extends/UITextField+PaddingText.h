//
//  UITextField+PaddingText.h
//  mycloud.mapmark
//
//  Created by huhk.fnst@g08 on 15/7/16.
//  Copyright © 2015年 fujitsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (PaddingText)
@property (nonatomic,assign) int leftPadding;
@property (nonatomic,assign) int rightPadding;



-(void) setLeftPadding:(int) paddingValue;

-(void) setRightPadding:(int) paddingValue;

@end
