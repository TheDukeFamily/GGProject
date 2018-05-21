//
//  GGStaticTableViewController.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGTableViewController.h"
#import "GGWorldItem.h"
#import "GGWordArrowItem.h"
#import "GGItemSection.h"

@interface GGStaticTableViewController : GGTableViewController

/** 需要把组模型添加到数据中 */
@property (nonatomic, strong) NSMutableArray<GGItemSection * > *sections;

/** 自定义某一行cell的时候调用super, 返回为空 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath NS_REQUIRES_SUPER;

- (GGStaticTableViewController *(^)(GGWorldItem *item))addItem;

@end

UIKIT_EXTERN const UIEdgeInsets tableViewDefaultSeparatorInset;
UIKIT_EXTERN const UIEdgeInsets tableViewDefaultLayoutMargins;
