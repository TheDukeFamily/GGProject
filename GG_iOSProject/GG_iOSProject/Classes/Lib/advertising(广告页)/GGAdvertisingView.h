//
//  GGAdvertisingView.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIKIT_EXTERN用于延伸扩展
UIKIT_EXTERN NSString *const NotificationContants_Advertise_Key;

@interface GGAdvertisingView : UIView

/** 显示广告页面方法*/
- (void)show;

/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;

@end
