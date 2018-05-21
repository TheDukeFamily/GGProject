//
//  GGNavigationController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGNavigationController.h"

@interface GGNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation GGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
    
    //默认开启系统右划返回
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -  push控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) { // 不是根控制器
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
