//
//  GGAdvertisingView.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGAdvertisingView.h"
#import <YYAnimatedImageView.h>
#import <YYImage.h>

NSString *const NotificationContants_Advertise_Key = @"GG_NotificationContants_Advertise_Key";

@interface GGAdvertisingView ()
@property (nonatomic, strong) YYAnimatedImageView *advertiseImageView;
@property (nonatomic, strong) UIButton *countBtn;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) dispatch_source_t gcdTimer;
@end

static const NSUInteger showAdvertiseTimer = 5;

@implementation GGAdvertisingView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        
        //广告图片，使用YYAnimatedImageView可填充GIF，或者普通样式图片
        _advertiseImageView = [[YYAnimatedImageView alloc] initWithFrame:frame];
        _advertiseImageView.userInteractionEnabled = YES;
        _advertiseImageView.contentMode = UIViewContentModeScaleAspectFill;
        _advertiseImageView.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAdvertise)];
        [_advertiseImageView addGestureRecognizer:tap];
        
        //跳过按钮
        CGFloat btnW = 60;
        CGFloat btnH = 30;
        _countBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenSize.width - btnW-24, [UIApplication sharedApplication].statusBarFrame.size.height+btnH, btnW, btnH)];
        [_countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%zd",showAdvertiseTimer] forState:UIControlStateNormal];
        [_countBtn setBackgroundColor:[UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6]];
         _countBtn.layer.cornerRadius = 4;
        
        [self addSubview:_advertiseImageView];
        [self addSubview:_countBtn];
    }
    return self;
}

- (void)show{
    [self startCountDown];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

- (void)setFilePath:(NSString *)filePath{
    _filePath = filePath;
    _advertiseImageView.image = [YYImage imageWithContentsOfFile:filePath];
}

#pragma mark - GCD倒计时
- (void)startCountDown{
    __block int timerout = showAdvertiseTimer+1; //倒计时时间 + 1
    __weak typeof(self) weakself = self;
    
    //gcd定时器
    self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.gcdTimer, dispatch_time(DISPATCH_TIME_NOW, 0), 1*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.gcdTimer, ^{
        if (timerout <= 0) {//判定倒计时结束
            [weakself dismiss];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself.countBtn setTitle:[NSString stringWithFormat:@"跳过%d",timerout] forState:UIControlStateNormal];
            });
            timerout -- ;
        }
    });
    dispatch_resume(self.gcdTimer);
}

#pragma mark - 广告图PushUrl
- (void)pushToAdvertise{
    [self dismiss];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationContants_Advertise_Key object:nil];
}

#pragma mark - dismiss
- (void)dismiss{
    dispatch_cancel(_gcdTimer);
    _gcdTimer = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0.f;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    });
}

- (void)dealloc{
    _gcdTimer = nil;
}

@end
