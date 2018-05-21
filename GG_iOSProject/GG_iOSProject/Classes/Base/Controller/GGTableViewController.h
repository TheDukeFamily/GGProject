//
//  GGTabbarViewController.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGBaseViewController.h"

@interface GGTableViewController : GGBaseViewController<UITableViewDelegate,UITableViewDataSource>

// 滚动视图将开始拖动，这个代理方法如果子类实现，必须调用super
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

@property (nonatomic, strong) UITableView *tableview;

/** tableview样式，默认plain */
- (instancetype)initWithStyle:(UITableViewStyle)style;

@end
