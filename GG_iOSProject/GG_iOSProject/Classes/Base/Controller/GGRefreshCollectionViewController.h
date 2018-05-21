//
//  GGRefreshCollectionViewController.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/21.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGCollectionViewController.h"

@interface GGRefreshCollectionViewController : GGCollectionViewController
- (void)loadMore:(BOOL)isMore;

// 结束刷新, 子类请求报文完毕调用
- (void)endHeaderFooterRefreshing;
@end
