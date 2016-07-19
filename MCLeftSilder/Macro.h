//
//  Macro.h
//  MCLeftSilder
//
//  Created by iOS on 16/7/19.
//  Copyright © 2016年 iOS. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

// 屏幕宽度
#define kscreenRect   [[UIScreen mainScreen] bounds]
#define kscreenWidth  [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height
#define kUserDefaults [NSUserDefaults standardUserDefaults]

// 颜色的定义
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kColorWithRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
//项目整体背景色
#define MCBaseColor kColorWithRGB(0xf6f6f6)

#endif /* Macro_h */
