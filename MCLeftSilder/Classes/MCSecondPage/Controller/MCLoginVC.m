//
//  MCLoginVC.m
//  MCLeftSilder
//
//  Created by 123 on 16/7/27.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MCLoginVC.h"

@interface MCLoginVC ()

@end

@implementation MCLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancleLogin)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStyleDone target:self action:@selector(doneLogin)];
}
/// 取消登录
-(void)cancleLogin{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/// 登录按钮点击事件
-(void)doneLogin{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
