//
//  GGRequestBaseViewController.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGTextViewController.h"

@class GGRequestBaseViewController;

@protocol GGRequestBaseViewControllerDelegate<NSObject>
@optional
#pragma mark - 网络监听
/*
 NotReachable = 0,
 ReachableViaWiFi = 2,
 ReachableViaWWAN = 1,
 ReachableVia2G = 3,
 ReachableVia3G = 4,
 ReachableVia4G = 5,
 */
- (void)netWorkStatus:(NetworkStatus)networkStatus inViewController:(GGRequestBaseViewController *)inViewController;
@end


@interface GGRequestBaseViewController : GGTextViewController<GGRequestBaseViewControllerDelegate>
#pragma mark - 加载框

- (void)showLoading;

- (void)dismissLoading;
@end
