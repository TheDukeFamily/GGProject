//
//  AppDelegate+AppService.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/15.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import "GGTabBarController.h"
#import "testViewController.h"

@implementation AppDelegate (AppService)

- (void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[GGTabBarController alloc] init];
    //避免在一个界面上同时点击多个UIButton导致同时响应多个方法
    [[UIButton appearance] setExclusiveTouch:YES];
    if (@available(iOS 11.0, *)) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}

@end
