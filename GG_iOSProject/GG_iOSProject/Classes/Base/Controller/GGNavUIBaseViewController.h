//
//  GGNavUIBaseViewController.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGNavigatrionBar.h"

@class GGNavUIBaseViewController;
@protocol GGNavUIBaseViewControllerDataSource <NSObject>

@optional
/** 控制器是否显示navBar */
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(GGNavUIBaseViewController*)navUIBaseViewController;
/** 控制器导航栏状态栏样式 */
- (UIStatusBarStyle)navUIBaseViewControllerPreferStatusBarStyle:(GGNavUIBaseViewController *)navUIBaseViewController;
@end

@interface GGNavUIBaseViewController : UIViewController <GGNavigationBarDelegate,GGNavigationBarDataSource,GGNavUIBaseViewControllerDataSource>
/** 导航栏默认字体 */
- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle;
/** 导航栏navBar */
@property (weak, nonatomic) GGNavigatrionBar *gg_navgationBar;
@end
