//
//  GGUmengHelper.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>

@interface GGUmengHelper : NSObject

//#pragma mark - UM推送
//
///** 初始化友盟推送 **/
//+ (void)UMPushStart:(NSDictionary *)launchOptions;
//
//#pragma mark - UM分享、登录
//
///** 初始化第三方登录 **/
//+ (void)UMSocialStart;
//
///** 自定义分享面板 **/
//+(void)shareTitle:(NSString *)title subTitle:(NSString *)subTitle thumbImage:(NSString *)thumbImage shareURL:(NSString *)shareUrl;

/** UM第三方登录 **/
//+ (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType completion:(void(^)(UMSocialUserInfoResponse *result, NSError *error))completion;

#pragma mark - UM统计

/** 启动友盟统计功能 **/
+ (void)UMAnalyticStart;

/** 在viewWillAppear调用,才能够获取正确的页面访问路径、访问深度（PV）的数据 **/
+ (void)beginLogPageView:(__unsafe_unretained Class)pageView;

/** 在viewDidDisappeary调用，才能够获取正确的页面访问路径、访问深度（PV）的数据 **/
+ (void)endLogPageView:(__unsafe_unretained Class)pageView;


/** 自定义名称 **/
/** 在viewWillAppear调用,才能够获取正确的页面访问路径、访问深度（PV）的数据 **/
+(void)beginLogPageViewName:(NSString *)pageViewName;

/** 在viewDidDisappeary调用，才能够获取正确的页面访问路径、访问深度（PV）的数据 **/
+(void)endLogPageViewName:(NSString *)pageViewName;


@end
