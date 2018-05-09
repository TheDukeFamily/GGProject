//
//  AppDelegate.m
//  GG_iOSProject
//
//  Created by Mac on 2018/4/23.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "AppDelegate.h"
#import "GGBaseViewController.h"
#import "GGIntroductoryPagesHelper.h"
#import "GGAdvertisingHelper.h"
#import "JPFPSStatus.h"

#import "GGUmengHelper.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[GGBaseViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    // 刷新率
#if defined(DEBUG)||defined(_DEBUG)
    [[JPFPSStatus sharedInstance] open];
#endif
    
    //引导页
    [GGIntroductoryPagesHelper showIntroductoryPageView:@[@"intro_0.jpg", @"intro_1.jpg", @"intro_2.jpg", @"intro_3.jpg"]];
    
    NSArray <NSString *> *imagesURLS = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189851096&di=224fad7f17468c2cc080221dd78a4abf&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F12%2F20150512124019_GPjEJ.gif"];
    // 启动广告
    [GGAdvertisingHelper showAdvertiserView:imagesURLS];
    
    // 友盟统计
//    [GGUmengHelper UMAnalyticStart];
//    // 友盟社交化
//    [LMJUMengHelper UMSocialStart];
//    // 友盟推送
//    [LMJUMengHelper UMPushStart:launchOptions];

    
    return YES;
}
@end
