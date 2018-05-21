//
//  GGCollectionViewController.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGBaseViewController.h"

@class GGCollectionViewController;

@protocol GGCollectionViewControllerDataSource <NSObject>

// 需要返回对应的布局
- (UICollectionViewLayout *)collectionViewController:(GGBaseViewController *)collectionViewController layoutForCollectionView:(UICollectionView *)collectionView;

@optional


@end


@interface GGCollectionViewController : GGBaseViewController<UICollectionViewDelegate, UICollectionViewDataSource, GGCollectionViewControllerDataSource>

@property (weak, nonatomic) UICollectionView *collectionView;

@end
