//
//  GGIntroductoryPagesGIFOperation.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGIntroductoryPagesGIFOperation : UIView
/**
 *  通过图片Data数据第一个字节来获取图片扩展名(严谨)
 */
+ (NSString *)gg_contentTypeForImageData:(NSData *)data;

/**
 *  通过图片URL的截取来获取图片的扩展名(不严谨)
 */
+ (NSString *)gg_contentTypeForImageURL:(NSString *)url;

/**
 *  自定义播放Gif图片(Path)
 *
 *  @param frame        位置和大小
 *  @param gifImagePath Gif图片路径
 *
 *  @return Gif图片对象
 */
- (id)initWithFrame:(CGRect)frame gifImagePath:(NSString *)gifImagePath;

/**
 *  自定义播放Gif图片(Data)(本地+网络)
 *
 *  @param frame        位置和大小
 *  @param gifImageData Gif图片Data
 *
 *  @return Gif图片对象
 */
- (id)initWithFrame:(CGRect)frame gifImageData:(NSData *)gifImageData;

/**
 *  自定义播放Gif图片(Name)
 *
 *  @param frame        位置和大小
 *  @param gifImageName Gif图片Name
 *
 *  @return Gif图片对象
 */
- (id)initWithFrame:(CGRect)frame gifImageName:(NSString *)gifImageName;
@end
