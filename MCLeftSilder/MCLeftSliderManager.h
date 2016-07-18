//
//  MCLeftSliderManager.h
//  MCLeftSilder
//
//  Created by iOS on 16/7/18.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCLeftSlideViewController.h"

@interface MCLeftSliderManager : NSObject
+(instancetype)sharedInstance;
@property (strong, nonatomic) MCLeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) UINavigationController *mainNavigationController;

@end
