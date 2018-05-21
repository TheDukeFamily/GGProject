//
//  GGNavUIBaseViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGNavUIBaseViewController.h"
#import <sys/utsname.h>

@interface GGNavUIBaseViewController ()

@end

@implementation GGNavUIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.gg_navgationBar.gg_width = self.view.gg_width;
    [self.view bringSubviewToFront:self.gg_navgationBar];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = [self navUIBaseViewControllerPreferStatusBarStyle:self];
}

#pragma mark - LMJNavUIBaseViewControllerDataSource
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(GGNavUIBaseViewController *)navUIBaseViewController{
    return YES;
}

- (UIStatusBarStyle)navUIBaseViewControllerPreferStatusBarStyle:(GGNavUIBaseViewController *)navUIBaseViewController{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - navBarDataSource
/**头部标题*/
- (NSMutableAttributedString * )gg_navigationBarTitle:(GGNavigatrionBar *)navigationbar{
    return [self changeTitle:self.title? : self.navigationItem.title];
}

/** 背景色 */
- (UIColor *)gg_navigationBackgroundColor:(GGNavigatrionBar *)navigationbar{
    return [UIColor redColor];
}

/** 导航条的高度 */
- (CGFloat)gg_navgationHeight:(GGNavigatrionBar *)navigationbar{
    return [UIApplication sharedApplication].statusBarFrame.size.height + 44.0f;
}

/** 背景图片 */
//- (UIImage *)gg_navigationBarbackgroundImage:(GGNavigatrionBar *)navigationbar{}


/** 是否显示底部黑线 */
- (BOOL)gg_navigationIsHideBottomLine:(GGNavigatrionBar *)navigationbar{
    return YES;
}

/** 导航条的左边的 view */
//- (UIView *)gg_navigationBarLeftView:(GGNavigatrionBar *)navigationBar{}

/** 导航条右边的 view */
//- (UIView *)gg_navigationBarRightView:(GGNavigatrionBar *)navigationBar{}

/** 导航条中间的 View */
//- (UIView *)gg_navigationBarTitleView:(GGNavigatrionBar *)navigationBar{}

/** 导航条左边的按钮 */
//- (UIImage *)gg_navigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(GGNavigatrionBar *)navigationBar{}

/** 导航条右边的按钮 */
//- (UIImage *)gg_navigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(GGNavigatrionBar *)navigationBar{}

#pragma mark - Delegate
- (void)gg_leftButtonEvent:(UIButton *)sender navigationBar:(GGNavigatrionBar *)navigationBar{
    NSLog(@"%s", __func__);
}

- (void)gg_rightButtonEvent:(UIButton *)sender navigationBar:(GGNavigatrionBar *)navigationBar{
    NSLog(@"%s", __func__);
}

- (void)gg_titleClickEvent:(UILabel *)sender navigationBar:(GGNavigatrionBar *)navigationBar{
    NSLog(@"%s", __func__);
}

#pragma mark 自定义代码
- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(0, title.length)];
    
    return title;
}

- (GGNavigatrionBar *)gg_navgationBar{
    if (!_gg_navgationBar && [self.parentViewController isKindOfClass:[UINavigationController class]] && [self navUIBaseViewControllerIsNeedNavBar:self]) {
        GGNavigatrionBar *navigationBar = [[GGNavigatrionBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        [self.view addSubview:navigationBar];
        navigationBar.dataSource = self;
        navigationBar.delegate = self;
        _gg_navgationBar = navigationBar;
    }
    return _gg_navgationBar;
}

- (void)setTitle:(NSString *)title{
    [super setTitle:title];
    self.gg_navgationBar.title = [self changeTitle:title];
}
@end
