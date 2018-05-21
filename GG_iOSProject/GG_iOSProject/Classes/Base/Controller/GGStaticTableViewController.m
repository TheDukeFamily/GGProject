//
//  GGStaticTableViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGStaticTableViewController.h"
#import "GGSettingCell.h"

const UIEdgeInsets tableViewDefaultSeparatorInset = {0, 15, 0, 0};
const UIEdgeInsets tableViewDefaultLayoutMargins = {8, 8, 8, 8};

@interface GGStaticTableViewController ()

@end

@implementation GGStaticTableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGWorldItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    
    GGSettingCell *cell = [GGSettingCell cellWithTableView:tableView andCellStyle:UITableViewCellStyleValue1];
    
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GGWorldItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    // 普通的cell
    if(item.itemOperation)
    {
        item.itemOperation(indexPath);
        return;
    }
    
    // 带箭头的cell
    if([item isKindOfClass:[GGWordArrowItem class]])
    {
        GGWordArrowItem *arrowItem = (GGWordArrowItem *)item;
        
        if(arrowItem.destVc)
        {
            UIViewController *vc = [[arrowItem.destVc alloc] init];
            if ([vc isKindOfClass:[UIViewController class]]) {
                vc.navigationItem.title = arrowItem.title;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
    }
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sections[section].headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return self.sections[section].footerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sections[indexPath.section].items[indexPath.row].cellHeight;
}

- (NSMutableArray<GGItemSection *> *)sections
{
    if(_sections == nil)
    {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

- (GGStaticTableViewController *(^)(GGWorldItem *))addItem {
    
    GGWeak(self);
    if (!self.sections.firstObject) {
        [self.sections addObject:[GGItemSection sectionWithItems:@[] andHeaderTitle:nil footerTitle:nil]];
    }
    return  ^(GGWorldItem *item) {
        [weakself.sections.firstObject.items addObject:item];
        return weakself;
    };
}

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

@end
