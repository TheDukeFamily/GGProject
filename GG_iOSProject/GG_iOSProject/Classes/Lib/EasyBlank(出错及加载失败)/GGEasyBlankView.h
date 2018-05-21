//
//  GGEasyBlankView.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/11.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    GGEasyBlankPageViewTypeNodata
} GGEasyBlankPageViewType;

@interface GGEasyBlankView : UIView
- (void)configWithType:(GGEasyBlankPageViewType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(UIButton *sender))block;
@end


@interface UIView (GGConfigBlank)
- (void)configBlankPage:(GGEasyBlankPageViewType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;
@end
