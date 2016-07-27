//
//  MCMainNavgationVC.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/18.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MCMainNavgationVC.h"
#import "MCLeftSliderManager.h"


@implementation MCMainNavgationVC

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    // 设置渲染的颜色
//    [self.navigationBar setTintColor:[UIColor orangeColor]];
    self.tabBarController.hidesBottomBarWhenPushed = YES;

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    [[MCLeftSliderManager sharedInstance].LeftSlideVC setPanEnabled:NO];
    [super pushViewController:viewController animated:animated];
    
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    NSLog(@"%@-----%@",self.viewControllers.firstObject,self.viewControllers.lastObject);
    
    
    if (self.viewControllers.count == 2) {
      [[MCLeftSliderManager sharedInstance].LeftSlideVC setPanEnabled:YES];
    }
    return  [super popViewControllerAnimated:animated];
}

@end
