//
//  GGAdvertisingHelper.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGAdvertisingHelper : NSObject

+ (instancetype)sharedInstance;

+ (void)showAdvertiserView:(NSArray<NSString *> *)imageArray;

@end
