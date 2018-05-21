//
//  GGEasyBlankDemoViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/11.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGEasyBlankDemoViewController.h"
#import "GGEasyBlankView.h"

#define LMJWeak(type)  __weak typeof(type) weak##type = type

@interface GGEasyBlankDemoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation GGEasyBlankDemoViewController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        NSMutableArray *dataArray = [NSMutableArray array];
        _dataArray = dataArray;
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 80.0f;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"出错及加载失败";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"加载失败" style:UIBarButtonItemStyleDone target:self action:@selector(viewDataError)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"数据为空" style:UIBarButtonItemStyleDone target:self action:@selector(viewDataNil)];
    [self loadMore];
}

- (void)viewDataError{
//    LMJWeak(self);
    [self.view configBlankPage:GGEasyBlankPageViewTypeNodata hasData:self.dataArray.count > 0 hasError:YES reloadButtonBlock:^(id sender) {
        [self loadMore];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (void)loadMore
{
    [self.view configBlankPage:GGEasyBlankPageViewTypeNodata hasData:self.dataArray.count hasError:self.dataArray.count > 0 reloadButtonBlock:^(id sender) {
        [self viewDataError];
    }];
}

@end
