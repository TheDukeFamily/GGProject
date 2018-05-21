//
//  GGSettingCellTableViewCell.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GGWorldItem;
@interface GGSettingCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView andCellStyle:(UITableViewCellStyle)style;

/** 静态单元格模型 */
@property (nonatomic, strong)  GGWorldItem *item;
@end
