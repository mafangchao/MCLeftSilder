//
//  MCMainPageViewController.m
//  LeftSlide
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "MCMainPageViewController.h"
#import "MCLeftSliderManager.h"
#define vBackBarButtonItemName  @"backArrow.png"    //导航条返回默认图片名

@interface MCMainPageViewController ()

@end

@implementation MCMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[MCLeftSliderManager sharedInstance].LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[MCLeftSliderManager sharedInstance].LeftSlideVC setPanEnabled:YES];
}

@end
