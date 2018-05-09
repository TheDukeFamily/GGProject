//
//  GGUmengHelper.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGUmengHelper.h"


@implementation GGUmengHelper

#pragma mark - UM统计

/** 启动友盟统计功能 **/
+ (void)UMAnalyticStart{
    
    [UMConfigure initWithAppkey:@"5af15a9f8f4a9d01a8000216" channel:@"App Store"];
    [UMConfigure setEncryptEnabled:YES];//打开加密传输

    NSString* deviceID =  [UMConfigure deviceIDForIntegration];
    if ([deviceID isKindOfClass:[NSString class]]) {
        NSLog(@"服务器端成功返回deviceID");
        NSLog(@"%@",deviceID);
    }
    else{
        NSLog(@"服务器端还没有返回deviceID");
    }

#ifdef DEBUG
    [UMConfigure setLogEnabled:YES];//设置打开日志
#endif
    
}

/** 在viewWillAppear调用,才能够获取正确的页面访问路径、访问深度（PV）的数据 **/
+ (void)beginLogPageView:(__unsafe_unretained Class)pageView{
    [MobClick beginLogPageView:NSStringFromClass(pageView)];
}

/** 在viewDidDisappeary调用，才能够获取正确的页面访问路径、访问深度（PV）的数据 **/
+ (void)endLogPageView:(__unsafe_unretained Class)pageView{
    [MobClick endLogPageView:NSStringFromClass(pageView)];
}

/** 自定义名称 **/
/** 在viewWillAppear调用,才能够获取正确的页面访问路径、访问深度（PV）的数据 **/
+(void)beginLogPageViewName:(NSString *)pageViewName{
    [MobClick beginLogPageView:pageViewName];
}


/** 在viewDidDisappeary调用，才能够获取正确的页面访问路径、访问深度（PV）的数据 **/
+(void)endLogPageViewName:(NSString *)pageViewName{
    [MobClick endLogPageView:pageViewName];
}

@end
