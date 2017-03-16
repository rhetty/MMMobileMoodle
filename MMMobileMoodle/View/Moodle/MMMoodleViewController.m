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

@interface MMMoodleViewController ()<JWTaggedScrollViewDataSource, JWTaggedScrollViewDelegate>
@property (weak, nonatomic) IBOutlet JWTaggedScrollView *taggedScrollView;
@property (strong, nonatomic) Popover *coursePopover;
@property (strong, nonatomic) UITableView *courseView;

@property (nonatomic, weak) MMMoodleViewModel *viewModel;

@end

@implementation MMMoodleViewController

//- (instancetype)initWithViewModel:(MMMoodleViewModel *)viewModel
//{
//  self = [super init];
//  if (self) {
//    self.viewMoodle = viewModel;
//  }
//  return self;
//}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.taggedScrollView.dataSource = self;
  self.taggedScrollView.delegate = self;
  
  self.automaticallyAdjustsScrollViewInsets = NO;
  
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Properties

- (UITableView *)courseView
{
  if (!_courseView) {
    _courseView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
  }
  return _courseView;
}

- (Popover *)coursePopover
{
  if (!_coursePopover) {
    _coursePopover = [[Popover alloc] init];
  }
  return _coursePopover;
}

#pragma mark - SigninDelegate

- (void)didSignin
{
  
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

#pragma mark - Action

- (IBAction)courseButtonPressed:(id)sender
{
  [self.coursePopover show:self.courseView point:CGPointMake(self.view.frame.size.width - 45, 64)];
}

@end
