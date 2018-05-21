//
//  GGTestRefreshTableViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/21.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGTestRefreshTableViewController.h"

@interface GGTestRefreshTableViewController ()

@end

@implementation GGTestRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    self.tableview.estimatedRowHeight = 100;
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (UIColor *)gg_navigationBackgroundColor:(GGNavigatrionBar *)navigationbar{
    return [UIColor redColor];
}

@end
