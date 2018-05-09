//
//  GGIntroductoryPagesHelper.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GGIntroductoryPagesHelper : NSObject
+ (instancetype)shareInstance;
+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray;
@end
