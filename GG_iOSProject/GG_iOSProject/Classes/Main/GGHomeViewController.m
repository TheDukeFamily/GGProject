//
//  GGHomeViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/21.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGHomeViewController.h"
#import "GGWordArrowItem.h"

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
    
    item0.destVc = [UIViewController class];
    
    GGItemSection *section0 = [GGItemSection sectionWithItems:@[item0] andHeaderTitle:@"静态单元格的头部标题" footerTitle:@"静态单元格的尾部标题"];
    
    [self.sections addObject:section0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 重写BaseViewController设置内容
- (UIColor *)gg_navigationBackgroundColor:(GGNavigatrionBar *)navigationbar{
    return [UIColor clearColor];
}

//- (BOOL)gg_navigationIsHideBottomLine:(GGNavigatrionBar *)navigationbar{
//    return YES;
//}

@end
