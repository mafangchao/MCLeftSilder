//
//  MCAdvertVC.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/19.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MCAdvertVC.h"
#import "LoadingAnimationView.h"
#import "DKNightVersion.h"

@interface MCAdvertVC ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation MCAdvertVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"点击进入广告链接";
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight+64)];
    _webView.backgroundColor = MCBaseColor;
    _webView.delegate = self;
    _webView.hidden = YES;
    [self.view addSubview:_webView];
    if (!self.adUrl) {
        self.adUrl = @"https://www.jianshu.com/u/c3bedfe6664d";
    }
//    self.navigationController.hidesBarsOnSwipe = YES;
    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    navigationLabel.text = @"点击进入广告链接";
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.adUrl]];
    [_webView loadRequest:request];
    
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        self.view.normalBackgroundColor = MCBaseColor;
        navigationLabel.nightTextColor = [UIColor whiteColor];
        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
        self.navigationController.navigationBar.nightTintColor = [UIColor redColor];
    }];
    [LoadingAnimationView loadingViewWithRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight+64) OnView:self.view];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(pushViewController)];
    
}

-(void)pushViewController{
    MCAdvertVC *adVc = [[MCAdvertVC alloc] init];
//    adVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:adVc animated:YES];
    
}
- (void)setAdUrl:(NSString *)adUrl
{
    _adUrl = adUrl;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [LoadingAnimationView hideFromView:self.view];
    _webView.hidden = NO;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [LoadingAnimationView hideFromView:self.view];
}

@end
