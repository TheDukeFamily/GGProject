//
//  GGNavigatrionBar.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGNavigatrionBar.h"

#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

#define kDefaultNavBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44.0)

#define kSmallTouchSizeHeight 44.0

#define kLeftRightViewSizeMinWidth 60.0

#define kLeftMargin 0.0

#define kRightMargin 0.0

#define kNavBarCenterY(H) ((self.frame.size.height - kStatusBarHeight - H) * 0.5 + kStatusBarHeight)

#define kViewMargin 5.0

@implementation GGNavigatrionBar


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self gg_setupNavigationBarUIOnce];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self gg_setupNavigationBarUIOnce];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.superview bringSubviewToFront:self];
    
    self.leftView.frame = CGRectMake(0, kStatusBarHeight, self.leftView.gg_width, self.leftView.gg_height);
    
    self.rightView.frame = CGRectMake(self.gg_width - self.rightView.gg_width, kStatusBarHeight, self.rightView.gg_width, self.rightView.gg_height);
    
    self.titleView.frame = CGRectMake(0, kStatusBarHeight + (44.0 - self.titleView.gg_height) * 0.5, MIN(self.gg_width - MAX(self.leftView.gg_width, self.rightView.gg_width) * 2 - kViewMargin * 2, self.titleView.gg_width), self.titleView.gg_height);
    
    self.titleView.gg_x = (self.gg_width*0.5 - self.titleView.gg_width*0.5);
    
    self.bottomBlackLineView.frame = CGRectMake(0, self.gg_height, self.gg_width, 0.5);
}

#pragma mark - Setter

- (void)setTitleView:(UIView *)titleView{
    [_titleView removeFromSuperview];
    [self addSubview:titleView];
    _titleView = titleView;
    
    __block BOOL isHaveTapGes = NO;
    
    [titleView.gestureRecognizers enumerateObjectsUsingBlock:^(__kindof UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UITapGestureRecognizer class]]) {
            isHaveTapGes = YES;
            *stop = YES;
        }
    }];
    
    if (!isHaveTapGes) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClick:)];
        [titleView addGestureRecognizer:tap];
    }
    [self layoutIfNeeded];
}

- (void)setTitle:(NSMutableAttributedString *)title{
    if ([self.dataSource respondsToSelector:@selector(gg_navigationBarTitleView:)] && [self.dataSource gg_navigationBarTitleView:self]) {
        return;
    }
    
    UILabel *navTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.gg_width*0.4, 44)];
    navTitleLabel.numberOfLines = 0;
    [navTitleLabel setAttributedText:title];
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    navTitleLabel.backgroundColor = [UIColor clearColor];
    navTitleLabel.userInteractionEnabled = YES;
    navTitleLabel.lineBreakMode = NSLineBreakByClipping;
    
    self.titleView = navTitleLabel;
}

- (void)setLeftView:(UIView *)leftView{
    [_leftView removeFromSuperview];
    [self addSubview:leftView];
    _leftView = leftView;
    
    if ([leftView isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)leftView;
        [btn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self layoutIfNeeded];
}

- (void)setRightView:(UIView *)rightView{
    [_rightView removeFromSuperview];
    [self addSubview:rightView];
    
    _rightView = rightView;
    
    if ([rightView isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)rightView;
        [button addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self layoutIfNeeded];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    _backgroundImage = backgroundImage;
    
    self.layer.contents = (id)backgroundImage.CGImage;
}

- (void)setDataSource:(id<GGNavigationBarDataSource>)dataSource{
    _dataSource = dataSource;
    [self setupDataSourceUI];
}

#pragma mark - getter
- (UIView *)bottomBlackLineView{
    if (!_bottomBlackLineView) {
        CGFloat height = 0.5;
        UIView *bottomBlackLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, height)];
        [self addSubview:bottomBlackLineView];
        _bottomBlackLineView = bottomBlackLineView;
        bottomBlackLineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _bottomBlackLineView;
}

#pragma mark - event
- (void)titleClick:(UIGestureRecognizer *)tap{
    UILabel *view = (UILabel *)tap.view;
    if ([self.delegate respondsToSelector:@selector(gg_titleClickEvent:navigationBar:)]) {
        [self.delegate gg_titleClickEvent:view navigationBar:self];
    }
}

- (void)leftBtnClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(gg_leftButtonEvent:navigationBar:)]) {
        [self.delegate gg_leftButtonEvent:sender navigationBar:self];
    }
}

- (void)rightBtnClick:(UIButton*)sender{
    if ([self.delegate respondsToSelector:@selector(gg_rightButtonEvent:navigationBar:)]) {
        [self.delegate gg_rightButtonEvent:sender navigationBar:self];
    }
}

#pragma mark - custom
- (void)setupDataSourceUI{
    if ([self.delegate respondsToSelector:@selector(gg_navgationHeight:)]) {
        self.gg_size = CGSizeMake(kScreenWidth, [self.dataSource gg_navgationHeight:self]);
    }else{
        self.gg_size = CGSizeMake(kScreenWidth, kDefaultNavBarHeight);
    }
    
    /** 底部是否显示黑线 */
    if ([self.dataSource respondsToSelector:@selector(gg_navigationIsHideBottomLine:)]) {
        if ([self.dataSource gg_navigationIsHideBottomLine:self]) {
            self.bottomBlackLineView.hidden = YES;
        }
    }
    
    /** 背景图片 */
    if ([self.dataSource respondsToSelector:@selector(gg_navigationBarbackgroundImage:)]) {
        self.backgroundImage = [self.dataSource gg_navigationBarbackgroundImage:self];
    }
    
    /** 背景色 */
    if ([self.dataSource respondsToSelector:@selector(gg_navigationBackgroundColor:)]) {
        self.backgroundColor = [self.dataSource gg_navigationBackgroundColor:self];
    }
    
    /** 导航中间的View */
    if ([self.dataSource respondsToSelector:@selector(gg_navigationBarTitleView:)]) {
        self.titleView = [self.dataSource gg_navigationBarTitleView:self];
    }else if([self.dataSource respondsToSelector:@selector(gg_navigationBarTitle:)]){
        self.title = [self.dataSource gg_navigationBarTitle:self];
    }
    
    /** 导航条的左边的 view */
    if ([self.dataSource respondsToSelector:@selector(gg_navigationBarLeftView:)]) {
        self.leftView = [self.dataSource gg_navigationBarLeftView:self];
    }else if ([self.dataSource respondsToSelector:@selector(gg_navigationBarLeftButtonImage:navigationBar:)]){
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kSmallTouchSizeHeight, kSmallTouchSizeHeight)];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        UIImage *image = [self.dataSource gg_navigationBarLeftButtonImage:button navigationBar:self];
        if (image) {
            [button setImage:image forState:UIControlStateNormal];
        }
        self.leftView = button;
    }
    
    /** 导航条的右边的 view */
    if ([self.dataSource respondsToSelector:@selector(gg_navigationBarRightView:)]) {
        self.rightView = [self.dataSource gg_navigationBarRightView:self];
    }else if([self.dataSource respondsToSelector:@selector(gg_navigationBarRightButtonImage:navigationBar:)]){
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kLeftRightViewSizeMinWidth, kSmallTouchSizeHeight)];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        UIImage *image = [self.dataSource gg_navigationBarLeftButtonImage:button navigationBar:self];
        if (image) {
            [button setImage:image forState:UIControlStateNormal];
        }
        self.rightView = button;
    }
}

- (void)gg_setupNavigationBarUIOnce
{
    self.backgroundColor = [UIColor whiteColor];
}

@end
