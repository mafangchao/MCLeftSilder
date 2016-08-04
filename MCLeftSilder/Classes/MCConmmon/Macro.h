//
//  Macro.h
//  MCLeftSilder
//
//  Created by iOS on 16/7/19.
//  Copyright © 2016年 iOS. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


#define kUserDefaults     [NSUserDefaults standardUserDefaults]

// 屏幕宽度
#define kScreenRect   [[UIScreen mainScreen] bounds]

#define kScreenSize           [[UIScreen mainScreen] bounds].size
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height

#define kMainPageDistance   100   //打开左侧窗时，中视图(右视图)露出的宽度
#define kMainPageScale   1.0  //打开左侧窗时，中视图(右视图）缩放比例
#define kMainPageCenter  CGPointMake(kScreenWidth + kScreenWidth * kMainPageScale / 2.0 - kMainPageDistance, kScreenHeight / 2)  //打开左侧窗时，中视图中心点

#define vCouldChangeDeckStateDistance  (kScreenWidth - kMainPageDistance) / 2.0 - 40 //滑动距离大于此数时，状态改变（关--》开，或者开--》关）
#define vSpeedFloat   0.7    //滑动速度

#define kLeftAlpha 0.9  //左侧蒙版的最大值
#define kLeftCenterX -50 //左侧初始偏移量
#define kLeftScale 1.0 //左侧初始缩放比例
//#define kLeftSwitchViewCenterX 0
#define vDeckCanNotPanViewTag    987654   // 不响应此侧滑的View的tag

// 颜色的定义
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kColorWithRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
//项目整体背景色
#define MCBaseColor kColorWithRGB(0xf6f6f6)

#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define FONT(fontSize)                      [UIFont systemFontOfSize:fontSize]

#endif /* Macro_h */
