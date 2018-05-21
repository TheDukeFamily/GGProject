//
//  GGListExpandHideViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/21.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGListExpandHideViewController.h"

@interface GGListExpandHideViewController ()

@end

@implementation GGListExpandHideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSMutableAttributedString *)gg_navigationBarTitle:(GGNavigatrionBar *)navigationbar{
    return [[NSMutableAttributedString alloc] initWithString:@"列表的展开收起"];
}

@end
