//
//  TipsManager.h
//  KaolaFM
//
//  Created by alex on 14-9-3.
//  Copyright (c) 2014年 kaolafm. All rights reserved.
//

@interface TipsManager : NSObject

+ (instancetype)sharedInstance;

/**
 *  显示提示，1.5s消失，不影响用户操作！
 *
 *  @param message 消息内容
 */
- (void)showTips:(NSString *)message;

- (void)startLodingViewInSuperView:(UIView*)view;

- (void)stopLodingView;


/**
 *  显示等待提示
 *
 *  @param message 消息内容
 *  @param lockScreen 是否锁屏
 *  @param tag     tag，便于取消
 */
-(void)showLoadingTips:(NSString *)message
            lockScreen:(BOOL)isLock
                   tag:(int)tag;

/**
 *  移出对应tag的等待提示
 *
 *  @param tag tag
 */
-(void)dismissLoadingTipsWithTag:(int)tag;

@end
