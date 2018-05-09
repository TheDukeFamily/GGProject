//
//  GGIntroductoryPagesHelper.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGIntroductoryPagesHelper.h"
#import "GGIntroductoryPagesView.h"

@interface GGIntroductoryPagesHelper ()

@property (weak, nonatomic) UIWindow *curwindow;

@property (strong, nonatomic) GGIntroductoryPagesView *curIntroductoryPagesView;

@end

@implementation GGIntroductoryPagesHelper

static GGIntroductoryPagesHelper *shareInstance_ = nil;

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance_ = [[GGIntroductoryPagesHelper alloc] init];
    });
    return shareInstance_;
}

+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray{
    if (![GGIntroductoryPagesHelper shareInstance].curIntroductoryPagesView) {
        [GGIntroductoryPagesHelper shareInstance].curIntroductoryPagesView = [GGIntroductoryPagesView pagesViewWithFrame:[UIScreen mainScreen].bounds Images:imageArray];
    }
    
    [GGIntroductoryPagesHelper shareInstance].curwindow = [UIApplication sharedApplication].keyWindow;
    [[GGIntroductoryPagesHelper shareInstance].curwindow addSubview:[GGIntroductoryPagesHelper shareInstance].curIntroductoryPagesView];
    
    
}
@end
