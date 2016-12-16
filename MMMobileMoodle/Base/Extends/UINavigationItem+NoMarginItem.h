//
//  UINavigationItem+NoMarginItem.h
//  mycloud.mapmark
//
//  Created by huhk.fnst@g08 on 15/7/14.
//  Copyright © 2015年 fujitsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (NoMarginItem)

-(void)setNoMarginLeftItems:(NSArray *)items;
-(void)setNoMarginRightItems:(NSArray *)items;
@end
