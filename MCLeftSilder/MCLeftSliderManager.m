//
//  MCLeftSliderManager.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/18.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MCLeftSliderManager.h"

@implementation MCLeftSliderManager

static id _instance;

+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

@end
