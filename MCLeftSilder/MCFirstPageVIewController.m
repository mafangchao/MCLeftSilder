//
//  MCFirstPageVIewController.m
//  LeftSlide
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "MCFirstPageVIewController.h"
#import "DKNightVersion.h"
#import "MCLeftSliderManager.h"

@implementation MCFirstPageVIewController

-(void)viewDidLoad{
    [super viewDidLoad];

    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    navigationLabel.text = @"首页";
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;

    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        self.view.normalBackgroundColor = [UIColor orangeColor];
        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
        navigationLabel.nightTextColor = [UIColor whiteColor];
        self.navigationController.navigationBar.nightBarTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.nightTintColor = [UIColor redColor];
        self.tabBarController.tabBar.nightBarTintColor = [UIColor blackColor];
    }];
}



@end
