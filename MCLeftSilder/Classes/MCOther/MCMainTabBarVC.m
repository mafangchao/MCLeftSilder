//
//  MCMainTabBarVC.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MCMainTabBarVC.h"
#import "MCMainTabBar.h"

@interface MCMainTabBarVC ()

@end

@implementation MCMainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
}

#pragma mark - 3、添加自定义tabBar------
- (void)setUpTabBar
{
    // 1、创建自定义的CHTabBar;
    MCMainTabBar *tabBar = [[MCMainTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}


@end
