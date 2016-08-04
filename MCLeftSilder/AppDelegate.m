//
//  AppDelegate.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/18.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "AppDelegate.h"
#import "MCLeftSortsViewController.h"
#import "MCFirstPageVIewController.h"
#import "MCSecondPageViewController.h"
#import "MCMainNavgationVC.h"
#import "MCLeftSlideViewController.h"
#import "MCLeftSliderManager.h"
#import "MCAdvertView.h"
#import "MCAdvertManager.h"
#import "MCMainTabBar.h"
#import "MCMainTabBarVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    [self.window makeKeyAndVisible];
    
    [self initRootViewController];

    return YES;
}
/// 设置跟控制器
-(void)initRootViewController{
    
    MCFirstPageVIewController *firstVC = [[MCFirstPageVIewController alloc] init];
    
    UINavigationController *firstNav = [[MCMainNavgationVC alloc] initWithRootViewController:firstVC];
    firstNav.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    firstVC.title = @"首页";
    firstVC.navigationController.navigationBar.barTintColor = [UIColor redColor];
    MCSecondPageViewController *secondVC = [[MCSecondPageViewController alloc] init];

    UINavigationController *secondNav = [[MCMainNavgationVC alloc] initWithRootViewController:secondVC];
    secondNav.tabBarItem.image = [UIImage imageNamed:@"tab_me_nor"];
    secondVC.title = @"设置";
    
    MCMainTabBarVC *tabVC = [[MCMainTabBarVC alloc] init];
    [tabVC setViewControllers:@[firstNav,secondNav]];
    tabVC.tabBar.tintColor = [UIColor orangeColor];
    
    MCLeftSortsViewController *leftVC = [[MCLeftSortsViewController alloc] init];
    MCLeftSlideViewController *rootVC = [[MCLeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabVC];
    self.window.rootViewController = rootVC;
    
    // 启动图片
    [[MCAdvertManager sharedInstance] setAdvertViewController];
}


@end
