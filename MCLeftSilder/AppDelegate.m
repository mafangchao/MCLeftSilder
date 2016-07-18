//
//  AppDelegate.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/18.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "AppDelegate.h"
#import "MCMainPageViewController.h"
#import "MCLeftSortsViewController.h"
#import "MCFirstPageVIewController.h"
#import "MCSecondPageViewController.h"
#import "MCMainNavgationVC.h"
#import "MCLeftSlideViewController.h"
#import "MCLeftSliderManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    [self.window makeKeyAndVisible];
    
    [self initRootViewController];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];

    return YES;
}

-(void)initRootViewController{
    
    MCFirstPageVIewController *firstVC = [[MCFirstPageVIewController alloc] init];
    
    UINavigationController *firstNav = [[MCMainNavgationVC alloc] initWithRootViewController:firstVC];
    firstNav.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    firstVC.title = @"首页";
    firstVC.navigationController.navigationBar.barTintColor = [UIColor redColor];
    MCSecondPageViewController *secondVC = [[MCSecondPageViewController alloc] init];
//    secondVC.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *secondNav = [[MCMainNavgationVC alloc] initWithRootViewController:secondVC];
    secondNav.tabBarItem.image = [UIImage imageNamed:@"tab_me_nor"];
    secondVC.title = @"设置";
    
    
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    [tabVC setViewControllers:@[firstNav,secondNav]];
    tabVC.tabBar.tintColor = [UIColor orangeColor];
//    tabVC.tabBar.barTintColor = [UIColor grayColor];
    MCLeftSortsViewController *leftVC = [[MCLeftSortsViewController alloc] init];
    MCLeftSlideViewController *rootVC = [[MCLeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabVC];
    self.window.rootViewController = rootVC;
}


@end
