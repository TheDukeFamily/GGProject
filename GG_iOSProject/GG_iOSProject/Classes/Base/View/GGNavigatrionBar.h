//
//  GGNavigatrionBar.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GGNavigatrionBar;

@protocol GGNavigationBarDataSource<NSObject>

@optional
/**头部标题*/
- (NSMutableAttributedString * )gg_navigationBarTitle:(GGNavigatrionBar *)navigationbar;
/** 背景图片 */
- (UIImage *)gg_navigationBarbackgroundImage:(GGNavigatrionBar *)navigationbar;
 /** 背景色 */
- (UIColor *)gg_navigationBackgroundColor:(GGNavigatrionBar *)navigationbar;
/** 是否显示底部黑线 */
- (BOOL)gg_navigationIsHideBottomLine:(GGNavigatrionBar *)navigationbar;
/** 导航条的高度 */
- (CGFloat)gg_navgationHeight:(GGNavigatrionBar *)navigationbar;
/** 导航条的左边的 view */
- (UIView *)gg_navigationBarLeftView:(GGNavigatrionBar *)navigationBar;
/** 导航条右边的 view */
- (UIView *)gg_navigationBarRightView:(GGNavigatrionBar *)navigationBar;
/** 导航条中间的 View */
- (UIView *)gg_navigationBarTitleView:(GGNavigatrionBar *)navigationBar;
/** 导航条左边的按钮 */
- (UIImage *)gg_navigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(GGNavigatrionBar *)navigationBar;
/** 导航条右边的按钮 */
- (UIImage *)gg_navigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(GGNavigatrionBar *)navigationBar;
@end

@protocol GGNavigationBarDelegate <NSObject>

@optional
/** 左边的按钮的点击 */
-(void)gg_leftButtonEvent:(UIButton *)sender navigationBar:(GGNavigatrionBar *)navigationBar;
/** 右边的按钮的点击 */
-(void)gg_rightButtonEvent:(UIButton *)sender navigationBar:(GGNavigatrionBar *)navigationBar;
/** 中间如果是 label 就会有点击 */
-(void)gg_titleClickEvent:(UILabel *)sender navigationBar:(GGNavigatrionBar *)navigationBar;
@end

@interface GGNavigatrionBar : UIView

/** 导航栏底部黑线 */
@property (weak, nonatomic) UIView *bottomBlackLineView;

/** 导航栏中间View */
@property (weak, nonatomic) UIView *titleView;

/** 导航栏左边View */
@property (weak, nonatomic) UIView *leftView;

/** 导航栏右边View */
@property (weak, nonatomic) UIView *rightView;

/** 导航栏文字 */
@property (nonatomic, copy) NSMutableAttributedString *title;

/** 导航栏数据代理 */
@property (weak, nonatomic) id <GGNavigationBarDataSource> dataSource;

/** 导航栏事件代理 */
@property (weak, nonatomic) id <GGNavigationBarDelegate> delegate;

/** 导航栏背景图片 */
@property (weak ,nonatomic) UIImage *backgroundImage;

@end
