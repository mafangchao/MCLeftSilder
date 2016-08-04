
//  TipsManager.m
//  KaolaFM
//
//  Created by alex on 14-9-3.
//  Copyright (c) 2014年 kaolafm. All rights reserved.
//

#define aWindow ((AppDelegate*)[[UIApplication sharedApplication] delegate])
//#define aa ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#import "Macro.h"
#import "TipsManager.h"
#import "AppDelegate.h"

@interface TipsManager ()
{
    UIActivityIndicatorView *_activityView;
}
@end

@implementation TipsManager

static  TipsManager *sharedInstance = nil ;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)showTips:(NSString *)message
{
    [self showTips:message stayTime:2];
}

-(void)showTips:(NSString *)message stayTime:(float)stayTime
{
    int tag = 1000000;
    
//    AppDelegate *appdel =  [UIApplication sharedApplication].delegate;
    
    UIView *maskView = [aWindow.window viewWithTag:tag];
    if(maskView){
        [maskView removeFromSuperview];
    }
    //矩形
    UIView *rectView = [[UIView alloc] init];
    rectView.frame = CGRectMake(0, 0, 175, 85);
    rectView.center = CGPointMake(kScreenWidth/2, kScreenHeight/2 - 40);//向上偏40
    rectView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    rectView.layer.masksToBounds = YES;
    rectView.layer.cornerRadius = 5;
    rectView.tag = 1000000;
    [aWindow.window addSubview:rectView];
    
    //提示框
    UILabel *lbMessage = [[UILabel alloc] init];
    lbMessage.frame = rectView.bounds;
    lbMessage.backgroundColor = [UIColor clearColor];
    lbMessage.text = message;
    lbMessage.textAlignment = NSTextAlignmentCenter;
    lbMessage.textColor = [UIColor whiteColor];
    lbMessage.numberOfLines = 3;
    lbMessage.font = [UIFont systemFontOfSize:15];
    [rectView addSubview:lbMessage];
    
    float delayInSeconds = 1.3;
    if (stayTime > 0) {
        delayInSeconds = stayTime;
    }
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [UIView animateWithDuration:0.2 animations:^(void){
            rectView.alpha = 0.1;
        } completion:^(BOOL finished){
            [rectView removeFromSuperview];
        }];
    });

}

- (void)startLodingViewInSuperView:(UIView*)view
{
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    _activityView.frame = Rect((ScreenWidth-20)/2, (ScreenHeight-20)/2, 20, 20);
      _activityView.frame = Rect((kScreenWidth-20)/2, (kScreenHeight-20)/2, 20, 20);
    //    _activityView.color = [UIColor redColor];
    [view addSubview:_activityView];
    
    [_activityView startAnimating];
}
-(void)stopLodingView
{
    [_activityView stopAnimating];
    [_activityView removeFromSuperview];
}


-(void)showLoadingTips:(NSString *)message lockScreen:(BOOL)isLock tag:(int)tag;
{
    [self dismissLoadingTipsWithTag:tag];
    @autoreleasepool {
        tag += 55000;
        //初始化遮罩层
        UIView *maskView = [[UIView alloc] init];
        maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.01];
        maskView.tag = tag;
        
        UIView *rectView = [[UIView alloc] init];
        rectView.frame = CGRectMake(0, 0, 175, 85);
        rectView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        rectView.layer.masksToBounds = YES;
        rectView.layer.cornerRadius = 5;
        if (isLock) {
            //锁屏
            maskView.userInteractionEnabled = YES;
            maskView.frame = aWindow.window.bounds;
            rectView.center = CGPointMake(kScreenWidth/2, kScreenHeight/2 - 40);//向上40
        }else{
            //不锁屏
            maskView.frame = CGRectMake(0, 0, 175, 85);
            maskView.center = CGPointMake(kScreenWidth/2, kScreenHeight/2 - 40);//向上40
            rectView.frame = maskView.bounds;
        }
        [maskView addSubview:rectView];
        
        //提示框
        UILabel *lbMessage = [[UILabel alloc] init];
        //    lbMessage.frame = CGRectMake(10, 25, rectView.frame.size.width - 20, 60);
        lbMessage.frame = CGRectMake(0, 20, 175, 65);
        lbMessage.backgroundColor = [UIColor clearColor];
        lbMessage.text = message;
        lbMessage.textAlignment = NSTextAlignmentCenter;
        lbMessage.textColor = [UIColor whiteColor];
        lbMessage.numberOfLines = 3;
        lbMessage.font = FONT(15);
        [rectView addSubview:lbMessage];
        //    lbMessage.backgroundColor = [UIColor greenColor];
        
        UIActivityIndicatorView  *activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [activityView setCenter:CGPointMake(175/2, 20)];
        [activityView startAnimating];
        //    activityView.backgroundColor = [UIColor redColor];
        [rectView addSubview:activityView];
        
        [aWindow.window addSubview:maskView];
    }
}

-(void)dismissLoadingTipsWithTag:(int)tag
{
    
    tag += 55000;
    UIView *maskView = [aWindow.window viewWithTag:tag];
    if(maskView){
        [maskView removeFromSuperview];
    }
}
@end
