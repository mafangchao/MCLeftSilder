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
    self.mainNavigationController = [[MCMainNavgationVC alloc] initWithRootViewController:firstVC];
    self.mainNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    self.mainNavigationController.tabBarItem.title = @"首页";
    
    MCSecondPageViewController *secondVC = [[MCSecondPageViewController alloc] init];
    UINavigationController *secondNav = [[MCMainNavgationVC alloc] initWithRootViewController:secondVC];
    secondNav.tabBarItem.image = [UIImage imageNamed:@"tab_me_nor"];
    secondNav.tabBarItem.title = @"设置";
    
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    [tabVC setViewControllers:@[self.mainNavigationController,secondNav]];
    tabVC.tabBar.backgroundColor = [UIColor redColor];
    tabVC.tabBar.tintColor = [UIColor orangeColor];
    MCLeftSortsViewController *leftVC = [[MCLeftSortsViewController alloc] init];
    self.LeftSlideVC = [[MCLeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabVC];
    self.window.rootViewController = self.LeftSlideVC;
}


@end
