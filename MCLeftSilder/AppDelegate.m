//
//  AppDelegate.m
//  MCLeftSilder
//
//  Created by iOS on 16/7/18.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "AppDelegate.h"
#import "MCLeftSortsViewController.h"
#import "MCFirstPageVIewController.h"
#import "MCSecondPageViewController.h"
#import "MCMainNavgationVC.h"
#import "MCLeftSlideViewController.h"
#import "MCLeftSliderManager.h"
#import "MCAdvertView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    [self.window makeKeyAndVisible];
    
    [self initRootViewController];
    


    return YES;
}
/// 设置跟控制器
-(void)initRootViewController{
    
    MCFirstPageVIewController *firstVC = [[MCFirstPageVIewController alloc] init];
    
    UINavigationController *firstNav = [[MCMainNavgationVC alloc] initWithRootViewController:firstVC];
    firstNav.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    firstVC.title = @"首页";
    firstVC.navigationController.navigationBar.barTintColor = [UIColor redColor];
    MCSecondPageViewController *secondVC = [[MCSecondPageViewController alloc] init];

    UINavigationController *secondNav = [[MCMainNavgationVC alloc] initWithRootViewController:secondVC];
    secondNav.tabBarItem.image = [UIImage imageNamed:@"tab_me_nor"];
    secondVC.title = @"设置";
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    [tabVC setViewControllers:@[firstNav,secondNav]];
    tabVC.tabBar.tintColor = [UIColor orangeColor];
    
    MCLeftSortsViewController *leftVC = [[MCLeftSortsViewController alloc] init];
    MCLeftSlideViewController *rootVC = [[MCLeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabVC];
    self.window.rootViewController = rootVC;
    
    
    // 1.判断沙盒中是否存在广告图片，如果存在，直接显示
    NSString *filePath = [self getFilePathWithImageName:[kUserDefaults valueForKey:adImageName]];
    
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    if (isExist) {// 图片存在
        MCAdvertView *advertiseView = [[MCAdvertView alloc] initWithFrame:self.window.bounds];
        advertiseView.filePath = filePath;
        [advertiseView show];

        
    }
    
    // 2.无论沙盒中是否存在广告图片，都需要重新调用广告接口，判断广告是否更新
    [self getAdvertisingImage];
    
}


/**
 *  判断文件是否存在
 */
- (BOOL)isFileExistWithFilePath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = FALSE;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

/**
 *  初始化广告页面
 */
- (void)getAdvertisingImage
{
    
    // TODO 请求广告接口
    
    // 这里原本采用美团的广告接口，现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    NSString *imageUrl = imageArray[arc4random() % imageArray.count];
    
    // 获取图片名:43-130P5122Z60-50.jpg
    NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = stringArr.lastObject;
    
    // 拼接沙盒路径
    NSString *filePath = [self getFilePathWithImageName:imageName];
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
        
        [self downloadAdImageWithUrl:imageUrl imageName:imageName];
        
    }
    
}

/**
 *  下载新图片
 */
- (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        
        NSString *filePath = [self getFilePathWithImageName:imageName]; // 保存文件的名称
        
        if ([UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES]) {// 保存成功
            NSLog(@"保存成功");
            [self deleteOldImage];
            [kUserDefaults setValue:imageName forKey:adImageName];
            [kUserDefaults synchronize];
            // 如果有广告链接，将广告链接也保存下来
        }else{
            NSLog(@"保存失败");
        }
        
    });
}

/**
 *  删除旧图片
 */
- (void)deleteOldImage
{
    NSString *imageName = [kUserDefaults valueForKey:adImageName];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

/**
 *  根据图片名拼接文件路径
 */
- (NSString *)getFilePathWithImageName:(NSString *)imageName
{
    if (imageName) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        
        return filePath;
    }
    
    return nil;
}


@end
