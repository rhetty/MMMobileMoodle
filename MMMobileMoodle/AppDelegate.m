//
//  AppDelegate.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/16.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "AppDelegate.h"
#import "MMMoodleViewModel.h"
#import "MMArchiveViewModel.h"
#import "MMMeViewModel.h"
#import "MMViewModelServiceImpl.h"
#import "MMMoodleViewController.h"
#import "MMArchiveViewController.h"
#import "MMMeViewController.h"
#import "AccountInfo.h"
#import "SigninViewController.h"
#import "MMSigninViewModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIViewController *)createInitialViewController
{
  MMViewModelServiceImpl *moodleViewModelService = [[MMViewModelServiceImpl alloc] init];
  MMMoodleViewModel *moodleViewModel = [[MMMoodleViewModel alloc] initWithService:moodleViewModelService];
  MMMoodleViewController *moodleViewController = [[MMMoodleViewController alloc] initWithViewModel:moodleViewModel];
  UINavigationController *moodleNavigationController = [[UINavigationController alloc] initWithRootViewController:moodleViewController];
  moodleViewModelService.navigationController = moodleNavigationController;
  
  MMViewModelServiceImpl *archiveViewModelService = [[MMViewModelServiceImpl alloc] init];
  MMArchiveViewModel *archiveViewModel = [[MMArchiveViewModel alloc] initWithService:archiveViewModelService];
  MMArchiveViewController *archiveViewController = [[MMArchiveViewController alloc] initWithViewModel:archiveViewModel];
  UINavigationController *archiveNavigationController = [[UINavigationController alloc] initWithRootViewController:archiveViewController];
  archiveViewModelService.navigationController = archiveNavigationController;
  
  MMViewModelServiceImpl *meViewModelService = [[MMViewModelServiceImpl alloc] init];
  MMMeViewModel *meViewModel = [[MMMeViewModel alloc] initWithService:meViewModelService];
  MMMeViewController *meViewController = [[MMMeViewController alloc] initWithViewModel:meViewModel];
  UINavigationController *meNavigationController = [[UINavigationController alloc] initWithRootViewController:meViewController];
  meViewModelService.navigationController = meNavigationController;
  
  moodleNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Moodle", nil) image:[UIImage imageNamed:@"moodle_icon"] tag:1];
  archiveNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Archive", nil) image:[UIImage imageNamed:@"archive_icon"] tag:2];
  meNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Me", nil) image:[UIImage imageNamed:@"me_icon"] tag:3];
  UITabBarController *tabBarController = [[UITabBarController alloc] init];
  tabBarController.viewControllers = @[moodleNavigationController, archiveNavigationController, meNavigationController];
  return tabBarController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [self createInitialViewController];
  [self.window makeKeyAndVisible];
  
  if (![AccountInfo localInstance]) {
    MMSigninViewModel *signinViewModel = [[MMSigninViewModel alloc] initWithService:nil];
    SigninViewController *svc = [[SigninViewController alloc] initWithViewModel:signinViewModel];
    [self.window.rootViewController presentViewController:svc animated:NO completion:nil];
  }
  
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"MMMobileMoodle"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
