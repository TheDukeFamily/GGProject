//
//  UIView+GGFrame.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "UIView+GGFrame.h"

@implementation UIView (GGFrame)

- (CGFloat)gg_x{
    return self.frame.origin.x;
}

- (void)setGg_x:(CGFloat)gg_x{
    CGRect frame = self.frame;
    frame.origin.x = gg_x;
    self.frame = frame;
}

- (CGFloat)gg_y{
    return self.frame.origin.y;
}

- (void)setGg_y:(CGFloat)gg_y{
    CGRect frame = self.frame;
    frame.origin.y = gg_y;
    self.frame = frame;
}

- (CGFloat)gg_right{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setGg_right:(CGFloat)gg_right{
    CGRect frame = self.frame;
    frame.origin.x = gg_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)gg_bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setGg_bottom:(CGFloat)gg_bottom{
    CGRect frame = self.frame;
    frame.origin.y = gg_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)gg_width{
    return self.frame.size.width;
}

- (void)setGg_width:(CGFloat)gg_width{
    CGRect frame = self.frame;
    frame.size.width = gg_width;
    self.frame = frame;
}

- (CGFloat)gg_height{
    return self.frame.size.height;
}

- (void)setGg_height:(CGFloat)gg_height{
    CGRect frame = self.frame;
    frame.size.height = gg_height;
    self.frame = frame;
}

- (CGFloat)gg_centerX{
    return self.center.x;
}

- (void)setGg_centerX:(CGFloat)gg_centerX{
    self.center = CGPointMake(gg_centerX, self.center.y);
}

- (CGFloat)gg_centerY{
    return self.center.y;
}

- (void)setGg_centerY:(CGFloat)gg_centerY{
     self.center = CGPointMake(self.center.x, gg_centerY);
}


- (CGPoint)gg_origin{
    return self.frame.origin;
}

- (void)setGg_origin:(CGPoint)gg_origin{
    CGRect frame = self.frame;
    frame.origin = gg_origin;
    self.frame = frame;
}

- (CGSize)gg_size{
    return self.frame.size;
}

- (void)setGg_size:(CGSize)gg_size{
    CGRect frame = self.frame;
    frame.size = gg_size;
    self.frame = frame;
}

@end
