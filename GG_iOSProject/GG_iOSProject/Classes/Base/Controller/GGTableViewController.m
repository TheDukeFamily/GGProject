//
//  GGTabbarViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGTableViewController.h"

@interface GGTableViewController ()
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@end

@implementation GGTableViewController

- (UITableView *)tableview{
    if (!_tableview) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        [self.view addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableview = tableView;
    }
    return _tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseTableViewUI];
}

- (void)setupBaseTableViewUI{
    self.tableview.backgroundColor = self.view.backgroundColor;
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        UIEdgeInsets contentInset = self.tableview.contentInset;
        contentInset.top += self.gg_navgationBar.gg_height;
        self.tableview.contentInset = contentInset;
    }
    
    //适配ios11
    self.tableview.estimatedRowHeight = 0;
    self.tableview.estimatedSectionHeaderHeight = 0;
    self.tableview.estimatedSectionFooterHeight = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - scrollDeleggate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    UIEdgeInsets contentInset = self.tableview.contentInset;
    contentInset.bottom -= self.tableview.mj_footer.gg_height;
    self.tableview.scrollIndicatorInsets = contentInset;
    [self.view endEditing:YES];
}

#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}



- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init]) {
        _tableViewStyle = style;
    }
    
    return self;
}

- (void)dealloc
{
    
}

@end
