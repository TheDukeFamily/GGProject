//
//  GGItemSection.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GGWorldItem;
@interface GGItemSection : NSObject
/** <#digest#> */
@property (nonatomic, copy) NSString *headerTitle;

/** <#digest#> */
@property (nonatomic, copy) NSString *footerTitle;

/** <#digest#> */
@property (nonatomic, strong) NSMutableArray<GGWorldItem *> *items;

+ (instancetype)sectionWithItems:(NSArray<GGWorldItem *> *)items andHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;
@end
