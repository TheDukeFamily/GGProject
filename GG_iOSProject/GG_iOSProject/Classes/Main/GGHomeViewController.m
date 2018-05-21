//
//  GGHomeViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/21.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGHomeViewController.h"
#import "GGWordArrowItem.h"
#import "GGTestRefreshTableViewController.h"
#import "GGAnimationNavBarViewController.h"
#import "GGListExpandHideViewController.h"

@interface GGHomeViewController ()

@end

@implementation GGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.backgroundColor = [UIColor whiteColor];
    [self.navigationController.tabBarItem setBadgeValue:@"2"];
    UIEdgeInsets edgeInsets = self.tableview.contentInset;
    edgeInsets.bottom += self.tabBarController.tabBar.gg_height;
    self.tableview.contentInset = edgeInsets;
    
    GGWordArrowItem *item0 = [GGWordArrowItem itemWithTitle:@"根据基类创建视图" subTitle: @"实例"];
    item0.destVc = [GGTestRefreshTableViewController class];
    
    GGWordArrowItem *item1 = [GGWordArrowItem itemWithTitle:@"导航栏颜色渐变" subTitle: @"实例"];
    item1.destVc = [GGAnimationNavBarViewController class];
    
    GGWordArrowItem *item2 = [GGWordArrowItem itemWithTitle:@"列表的展开收起" subTitle: @"实例"];
    item2.destVc = [GGListExpandHideViewController class];
    
    GGItemSection *section0 = [GGItemSection sectionWithItems:@[item0,item1,item2] andHeaderTitle:@"静态单元格的header" footerTitle:@"静态单元格的footer"];
    
    [self.sections addObject:section0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 重写BaseViewController设置内容
- (UIColor *)gg_navigationBackgroundColor:(GGNavigatrionBar *)navigationbar{
    return [UIColor blueColor];
}

//- (BOOL)gg_navigationIsHideBottomLine:(GGNavigatrionBar *)navigationbar{
//    return YES;
//}

@end
