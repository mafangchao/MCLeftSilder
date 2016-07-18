//
//  MCMainNavgationVC.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/18.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MCMainNavgationVC.h"

@implementation MCMainNavgationVC

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    [super pushViewController:viewController animated:animated];
    
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    return  [super popViewControllerAnimated:animated];
}

@end
