//
//  LoadingAnimationView.h
//  myApp
//
//  Created by 雷国林 on 15/10/26.
//  Copyright © 2015年 careerman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingAnimationView : UIView


+ (LoadingAnimationView *)loadingViewWithRect:(CGRect)frame OnView:(UIView *)view;

+ (BOOL)hideFromView:(UIView *)view;


@end
