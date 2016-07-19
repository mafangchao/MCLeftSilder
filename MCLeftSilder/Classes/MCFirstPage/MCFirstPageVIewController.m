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
#import "MCAdvertVC.h"

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:@"pushtoad" object:nil];
    UISwitch *sw = [UISwitch new];
    sw.frame = CGRectMake(100, 100, 100, 40);
    [sw addTarget:self action:@selector(switchClick) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw];
}

- (void)pushToAd {
    
    MCAdvertVC *adVc = [[MCAdvertVC alloc] init];
    [self.navigationController pushViewController:adVc animated:YES];
    
}

-(void)switchClick{
    MCAdvertVC *adVc = [[MCAdvertVC alloc] init];
    [self.navigationController pushViewController:adVc animated:YES];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    [[MCLeftSliderManager sharedInstance].LeftSlideVC setPanEnabled:NO];
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    [[MCLeftSliderManager sharedInstance].LeftSlideVC setPanEnabled:YES];
//}
@end
