//
//  GGIntroductoryPagesView.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGIntroductoryPagesView.h"
//#import "GGIntroductoryPagesGIFOperation.h"
#import <YYAnimatedImageView.h>
#import <YYImage.h>

@interface GGIntroductoryPagesView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray<NSString *> *imagesArray;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (weak, nonatomic) UIScrollView *scrollView;

@end

@implementation GGIntroductoryPagesView

+ (instancetype)pagesViewWithFrame:(CGRect)frame Images:(NSArray<NSString *> *)images{
    GGIntroductoryPagesView *pageView = [[self alloc] initWithFrame:frame];
    pageView.imagesArray = images;
    return pageView;
}

- (void)setupUIOnce{
    
    self.backgroundColor = [UIColor clearColor];
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapFrom)];
    tap.numberOfTapsRequired = 1;
    [self.scrollView addGestureRecognizer:tap];
}

- (void)handleSingleTapFrom{
    if (_pageControl.currentPage == self.imagesArray.count-1) {
        [self removeFromSuperview];
    }
}

- (void)setImagesArray:(NSArray<NSString *> *)imagesArray{
    _imagesArray = imagesArray;
    [self reloadPageView];
}

- (void)reloadPageView{
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.scrollView.contentSize = CGSizeMake((self.imagesArray.count+1)*[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.pageControl.numberOfPages = self.imagesArray.count;
    
    [self.imagesArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        使用YYAnimatedImageView加载
        YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] init];

        imageView.frame = CGRectMake(idx*[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

        YYImage *image = [YYImage imageNamed:obj];

        [imageView setImage:image];
        [self.scrollView addSubview:imageView];

//        判断图片帧数，原生加载(建议使用YYAnimatedImageView，下面方法内存快炸了)
//        UIImageView *imageView = [[UIImageView alloc] init];
//        imageView.frame = CGRectMake(idx*[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//        imageView.backgroundColor = [UIColor clearColor];
//        if ([[GGIntroductoryPagesGIFOperation gg_contentTypeForImageData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:obj ofType:nil]]] isEqualToString:@"gif"])
//        {
//            NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:obj ofType:nil]];
//            imageView = (UIImageView *)[[GGIntroductoryPagesGIFOperation alloc] initWithFrame:imageView.frame gifImageData:localData];
//            [self.scrollView addSubview:imageView];
//        } else
//        {
//            imageView.image = [UIImage imageNamed:obj];
//            [self.scrollView addSubview:imageView];
//        }
    }];
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offSet = scrollView.contentOffset;
    NSInteger page = (offSet.x/(self.bounds.size.width)+0.5);
    self.pageControl.currentPage = page;
    self.pageControl.hidden = (page>self.imagesArray.count - 1);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x >= (_imagesArray.count) * [UIScreen mainScreen].bounds.size.width) {
        [self removeFromSuperview];
    }
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:scrollView];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.delegate = self;
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height - 60, 0, 40)];
        pageControl.backgroundColor = [UIColor whiteColor];
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        [self addSubview:pageControl];
        _pageControl = pageControl;
    }
    return _pageControl;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUIOnce];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUIOnce];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

@end
