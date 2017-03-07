//
//  UIButton+Helper.m
//  XMGFundApp
//
//  Created by iOS on 16/7/25.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "UIControl+Helper.h"
#import <objc/runtime.h>

// 默认的按钮点击时间
static const NSTimeInterval defaultDuration = 1.0f;

// 记录是否忽略按钮点击事件，默认第一次执行事件
static BOOL _isIgnoreEvent = NO;
static void resetState() {
    _isIgnoreEvent = NO;
}

@implementation UIControl (Helper)
@dynamic clickDurationTime;

+ (void)load {
    SEL originSEL = @selector(sendAction:to:forEvent:);
    SEL mySEL = @selector(my_sendAction:to:forEvent:);
    
    Method originM = class_getInstanceMethod([self class], originSEL);
    const char *typeEncodinds = method_getTypeEncoding(originM);
    
    Method newM = class_getInstanceMethod([self class], mySEL);
    IMP newIMP = method_getImplementation(newM);
    
    if (class_addMethod([self class], mySEL, newIMP, typeEncodinds)) {
        class_replaceMethod([self class], originSEL, newIMP, typeEncodinds);
    } else {
        method_exchangeImplementations(originM, newM);
    }
}

- (void)my_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    // 保险起见，判断下Class类型
    if ([self isKindOfClass:[UIButton class]]) {
        
        //1. 按钮点击间隔事件
        self.clickDurationTime = self.clickDurationTime == 0 ? defaultDuration : self.clickDurationTime;
        
        //2. 是否忽略按钮点击事件
        if (_isIgnoreEvent) {
            //2.1 忽略按钮事件
            return;
        } else if(self.clickDurationTime > 0) {
            //2.2 不忽略按钮事件
            
            // 后续在间隔时间内直接忽略按钮事件
            _isIgnoreEvent = YES;
            
            // 间隔事件后，执行按钮事件
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.clickDurationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                resetState();
            });
            
            // 发送按钮点击消息
            [self my_sendAction:action to:target forEvent:event];
        }
        
    }
    else
    {
        [self my_sendAction:action to:target forEvent:event];
    }
}
#pragma mark - associate

- (void)setClickDurationTime:(NSTimeInterval)clickDurationTime {
    objc_setAssociatedObject(self, @selector(clickDurationTime), @(clickDurationTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)clickDurationTime {
    return [objc_getAssociatedObject(self, @selector(clickDurationTime)) doubleValue];
}
@end
