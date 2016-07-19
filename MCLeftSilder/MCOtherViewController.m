//
//  MCotherViewController.m
//  LeftSlide
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "MCOtherViewController.h"
#import "DKNightVersion.h"

@interface MCOtherViewController ()

@end

@implementation MCOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    navigationLabel.text = self.titleName;
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        
        navigationLabel.nightTextColor = [UIColor whiteColor];
        self.view.normalBackgroundColor = [UIColor whiteColor];
        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
        self.navigationController.navigationBar.nightTintColor = [UIColor redColor];
    }];
//    @weakify(self);
//    [self addColorChangedBlock:^{
//        @strongify(self);
//        self.view.normalBackgroundColor = [UIColor whiteColor];
//        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
//        self.navigationController.navigationBar.nightTintColor = [UIColor redColor];
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
