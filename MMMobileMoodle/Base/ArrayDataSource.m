//
//  ArrayDataSource.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/5/10.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "ArrayDataSource.h"

typedef void (^ConfigureCellBlock)(UITableViewCell *cell, id item);

@implementation ArrayDataSource
{
  NSString *_cellIdentifier;
  ConfigureCellBlock _configureCellBlock;
}

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier configureCellBlock:(void (^)(UITableViewCell *, id))block
{
  self = [super init];
  if (self) {
    _cellIdentifier = cellIdentifier;
    _configureCellBlock = block;
  }
  return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
  return self.items[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier
                                                          forIndexPath:indexPath];
  id item = [self itemAtIndexPath:indexPath];
  _configureCellBlock(cell, item);
  return cell;
}

@end
