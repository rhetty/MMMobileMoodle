//
//  MMMoodleViewController.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMMoodleViewController.h"
#import "JWTaggedScrollView.h"
#import "MMMobileMoodle-Bridging-Header.h"
#import "AccountInfo.h"
#import "SigninViewController.h"
#import "MMMoodleViewModel.h"
#import "JWComboBox.h"

@interface MMMoodleViewController ()<JWTaggedScrollViewDataSource, JWTaggedScrollViewDelegate, JWComboBoxDataSource, JWComboBoxDelegate>
@property (weak, nonatomic) IBOutlet JWTaggedScrollView *taggedScrollView;

@property (nonatomic, strong) MMMoodleViewModel *viewModel;
@property (nonatomic, weak) JWComboBox *courseSelectView;
@end

@implementation MMMoodleViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.taggedScrollView.dataSource = self;
  self.taggedScrollView.delegate = self;
  
  self.automaticallyAdjustsScrollViewInsets = NO;
  
  JWComboBox *comboBox = [[JWComboBox alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.5, UI_NAVIGATION_BAR_HEIGHT)];
  comboBox.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  comboBox.backgroundColor = [UIColor clearColor];
  comboBox.dataSource = self;
  comboBox.delegate = self;
  comboBox.contentLabelColor = [UIColor blackColor];
  self.navigationItem.titleView = comboBox;
  self.courseSelectView = comboBox;
  
  [RACObserve(self.viewModel, courses) subscribeNext:^(id x) {
    [self.courseSelectView reloadData];
  }];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - JWTaggedScrollViewDataSource

- (NSInteger)numberOfTags
{
  return 3;
}

- (NSString *)textForTag:(NSUInteger)index
{
  switch (index) {
    case 0:
      return NSLocalizedString(@"Assignment", nil);
    case 1:
      return NSLocalizedString(@"Notification", nil);
    case 2:
      return NSLocalizedString(@"Forum", nil);
    default:
      return EMPTY_STRING;
  }
}

- (UIView *)viewForTag:(NSUInteger)index
{
  UIView *view = [[UIView alloc] init];
  switch (index) {
    case 0:
      view.backgroundColor = [UIColor redColor];
      break;
    case 1:
      view.backgroundColor = [UIColor greenColor];
      break;
    case 2:
      view.backgroundColor = [UIColor blueColor];
      break;
      
    default:
      break;
  }
  return view;
}

#pragma mark - JWTaggedScrollViewDelegate

- (void)didSelectTag:(NSUInteger)index
{
  
}

#pragma mark - JWComboBoxDataSource

- (NSUInteger)numberOfOptionsInComboBox:(JWComboBox *)comboBox
{
  return self.viewModel.courses.count;
}

- (NSString *)comboBox:(JWComboBox *)comboBox contentAt:(NSUInteger)index
{
  return self.viewModel.courses[index].displayContent;
}

#pragma mark - JWComboBoxDelegate

- (void)comboBox:(JWComboBox *)comboBox didSelectAt:(NSUInteger)index
{
  debugLog(@"%li", index);
}

@end
