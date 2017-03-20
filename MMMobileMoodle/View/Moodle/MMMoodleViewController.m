//
//  MMMoodleViewController.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMMoodleViewController.h"
#import "MMMobileMoodle-Bridging-Header.h"
#import "AccountInfo.h"
#import "SigninViewController.h"
#import "MMMoodleViewModel.h"
#import "JWComboBox.h"
#import "MMAssignmentViewController.h"
#import "MMNotificationViewController.h"
#import "MMForumViewController.h"
#import "JWTaggedPageViewController.h"

@interface MMMoodleViewController ()<JWComboBoxDataSource, JWComboBoxDelegate>

@property (nonatomic, strong) MMMoodleViewModel *viewModel;
@property (nonatomic, weak) JWComboBox *courseSelectView;

@end

@implementation MMMoodleViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
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
  
  // set contents
  MMAssignmentViewController *assignmentVC = [[MMAssignmentViewController alloc] initWithViewModel:self.viewModel.assignmentViewModel];
  MMNotificationViewController *notificationVC = [[MMNotificationViewController alloc] initWithViewModel:self.viewModel.notificationViewModel];
  MMForumViewController *forumVC = [[MMForumViewController alloc] initWithViewModel:self.viewModel.forumViewModel];
  
  JWTaggedPageViewController *taggedPageVC = [[JWTaggedPageViewController alloc] init];
  [taggedPageVC addChildViewController:assignmentVC title:NSLocalizedString(@"Assignment", nil)];
  [taggedPageVC addChildViewController:notificationVC title:NSLocalizedString(@"Notification", nil)];
  [taggedPageVC addChildViewController:forumVC title:NSLocalizedString(@"Forum", nil)];
  taggedPageVC.tagHeight = 36.0f;
  [self addChildViewController:taggedPageVC];
  [taggedPageVC didMoveToParentViewController:self];
  taggedPageVC.view.frame = CGRectMake(0, UI_STATUS_BAR_HEIGHT + UI_NAVIGATION_BAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height - UI_STATUS_BAR_HEIGHT - UI_NAVIGATION_BAR_HEIGHT - UI_TAB_BAR_HEIGHT);
  taggedPageVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:taggedPageVC.view];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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
  self.viewModel.selectedCourse = index;
}

@end
