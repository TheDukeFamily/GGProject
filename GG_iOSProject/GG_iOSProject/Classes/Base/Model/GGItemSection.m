//
//  GGItemSection.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGItemSection.h"
#import "GGWorldItem.h"

@implementation GGItemSection
+ (instancetype)sectionWithItems:(NSArray<GGWorldItem *> *)items andHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle
{
    GGItemSection *item = [[self alloc] init];
    if (items.count) {
        [item.items addObjectsFromArray:items];
    }
    
    item.headerTitle = headerTitle;
    item.footerTitle = footerTitle;
    
    return item;
}

- (NSMutableArray<GGWorldItem *> *)items
{
    if(!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end
