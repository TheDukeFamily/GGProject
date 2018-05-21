//
//  GGRefreshCollectionViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/21.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGRefreshCollectionViewController.h"

@interface GGRefreshCollectionViewController ()

@end

@implementation GGRefreshCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GGWeak(self);
    self.collectionView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [weakself loadIsMore:NO];
    }];
    
    self.collectionView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        [weakself loadIsMore:YES];
    }];
    
    [self.collectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 内部方法
- (void)loadIsMore:(BOOL)isMore
{
    // 控制只能下拉或者上拉
    if (isMore) {
        if ([self.collectionView.mj_header isRefreshing]) {
            [self.collectionView.mj_footer endRefreshing];
            return;
        }
        self.collectionView.mj_header.hidden = YES;
        self.collectionView.mj_footer.hidden = NO;
    }else
    {
        if ([self.collectionView.mj_footer isRefreshing]) {
            [self.collectionView.mj_header endRefreshing];
            return;
        }
        self.collectionView.mj_header.hidden = NO;
        self.collectionView.mj_footer.hidden = YES;
    }
    [self loadMore:isMore];
}

// 结束刷新
- (void)endHeaderFooterRefreshing
{
    // 结束刷新状态
    ![self.collectionView.mj_header isRefreshing] ?: [self.collectionView.mj_header endRefreshing];
    ![self.collectionView.mj_footer isRefreshing] ?: [self.collectionView.mj_footer endRefreshing];
    self.collectionView.mj_header.hidden = NO;
    self.collectionView.mj_footer.hidden = NO;
}


// 子类需要调用调用
- (void)loadMore:(BOOL)isMore
{
    //        NSAssert(0, @"子类必须重载%s", __FUNCTION__);
}

@end
