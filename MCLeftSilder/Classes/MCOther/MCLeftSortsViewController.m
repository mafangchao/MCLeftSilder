//
//  MCLeftSortsViewController.h
//  LeftSlide
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "MCLeftSortsViewController.h"
#import "MCLeftSliderManager.h"
#import "MCOtherViewController.h"
#import "DKNightVersion.h"

@interface MCLeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation MCLeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.sectionHeaderHeight = 0;
    tableview.sectionFooterHeight = 0;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
  
    UISwitch *lightButton = [UISwitch new];
    lightButton.frame = CGRectMake((kScreenWidth - kMainPageDistance)/2 +100, kScreenHeight - 50, 200, 44);
    [lightButton addTarget:self action:@selector(changeLight) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:lightButton];
    // 设置夜间效果的颜色
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        self.view.normalBackgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"leftbackiamge"]];
        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
        self.tableview.normalBackgroundColor = [UIColor clearColor];
        self.tableview.nightBackgroundColor = UIColorFromRGB(0x343434);
        self.tableview.nightSeparatorColor = UIColorFromRGB(0x313131);
        self.navigationController.navigationBar.nightBarTintColor = UIColorFromRGB(0x444444);
        self.navigationItem.leftBarButtonItem.nightTintColor = [UIColor whiteColor];
        self.navigationItem.rightBarButtonItem.nightTintColor = [UIColor whiteColor];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"开通会员";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"QQ钱包";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"网上营业厅";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"个性装扮";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"我的收藏";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"我的相册";
    } else if (indexPath.row == 6) {
        cell.textLabel.text = @"我的文件";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MCOtherViewController *vc = [[MCOtherViewController alloc] init];
//    vc.titleName =
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    vc.titleName = cell.textLabel.text;
    [[MCLeftSliderManager sharedInstance].LeftSlideVC closeLeftView];//关闭左侧抽屉
    [[MCLeftSliderManager sharedInstance].mainNavigationController pushViewController:vc animated:NO];

}



-(void)changeLight{
    NSLog(@"daindad");
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
        [DKNightVersionManager dawnComing];
    } else {
        [DKNightVersionManager nightFalling];
    }
}

@end
