//
//  UIView+GGFrame.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GGFrame)

@property (nonatomic) CGFloat gg_x;
@property (nonatomic) CGFloat gg_y;
@property (nonatomic) CGFloat gg_width;
@property (nonatomic) CGFloat gg_height;
@property (nonatomic) CGFloat gg_bottom;
@property (nonatomic) CGFloat gg_right;
@property (nonatomic) CGFloat gg_centerX;
@property (nonatomic) CGFloat gg_centerY;
@property (nonatomic) CGPoint gg_origin;
@property (nonatomic) CGSize  gg_size;
@end
