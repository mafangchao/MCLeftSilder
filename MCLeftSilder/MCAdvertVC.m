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
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, kscreenHeight+64)];
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.delegate = self;
//    _webView.hidden = YES;
    if (!self.adUrl) {
        self.adUrl = @"http://www.jianshu.com/users/c3bedfe6664d/latest_articles";
    }
    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    navigationLabel.text = @"点击进入广告链接";
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.adUrl]];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        self.view.normalBackgroundColor = [UIColor whiteColor];
        navigationLabel.nightTextColor = [UIColor whiteColor];
        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
        self.navigationController.navigationBar.nightTintColor = [UIColor redColor];
    }];

}

- (void)setAdUrl:(NSString *)adUrl
{
    _adUrl = adUrl;
}


@end
