//
//  AppDelegate.m
//  GG_iOSProject
//
//  Created by Mac on 2018/4/23.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+AppService.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化window
    [self initWindow];
    
//    //初始化网络请求配置
//    [self NetWorkConfig];
//
//    //UMeng初始化
//    [self initUMeng];
//
//    //初始化app服务
//    [self initService];
//
//    //初始化IM
//    [[IMManager sharedIMManager] initIM];
//
//    //初始化用户系统
//    [self initUserManager];
//
//    //网络监听
//    [self monitorNetworkStatus];
//
//    //广告页
//    [AppManager appStart];

    
    return YES;
}
@end
