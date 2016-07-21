//
//  MCAdvertManager.h
//  MCLeftSilder
//
//  Created by iOS on 16/7/21.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCAdvertManager : NSObject

+(instancetype)sharedInstance;
-(void)setAdvertViewController;
@end
