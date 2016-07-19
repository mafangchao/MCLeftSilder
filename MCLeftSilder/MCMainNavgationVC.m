//
//  MCMainNavgationVC.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/18.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MCMainNavgationVC.h"

@implementation MCMainNavgationVC

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    // 设置渲染的颜色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    [super pushViewController:viewController animated:animated];
    
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    return  [super popViewControllerAnimated:animated];
}

@end
