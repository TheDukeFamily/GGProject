//
//  GGAdvertisingHelper.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGAdvertisingHelper.h"
#import "GGAdvertisingView.h"

//是否是空对象
#define GGAdvertisingIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

static NSString *const adImageName = @"GG_Advertising";

@implementation GGAdvertisingHelper

static GGAdvertisingHelper *_instance = nil;

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addClick:) name:NotificationContants_Advertise_Key object:nil];
    }
    return self;
}

+ (void)showAdvertiserView:(NSArray<NSString *> *)imageArray{
    //1.判断沙盒中是否存在广告图片,如果存在，直接显示
    NSString *filePath = [[GGAdvertisingHelper sharedInstance] getFilePathWithImageName:[[NSUserDefaults standardUserDefaults] valueForKey:adImageName]];
    
    //判断图片是否存在
    BOOL isExist = [[GGAdvertisingHelper sharedInstance] isFileExistWithFilePath:filePath];
    if (isExist) {
        GGAdvertisingView *advertisingView = [[GGAdvertisingView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        advertisingView.filePath = filePath;
        [advertisingView show];
    }
    
    //无论沙盒中是否存在广告图片，都需要重新调用广告接口，判断广告是否更新
    [[GGAdvertisingHelper sharedInstance] getAdvertisingImage:imageArray];
    
}

/**
 *  初始化广告页面
 */
- (void)getAdvertisingImage:(NSArray<NSString *> *)imageArray
{
    //随机取一张
    NSString *imageUrl = imageArray[arc4random() % imageArray.count];
    NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = stringArr.lastObject;
    
    // 拼接沙盒路径
    NSString *filePath = [self getFilePathWithImageName:imageName];
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
        [self downloadAdImageWithUrl:imageUrl imageName:imageName];
    }
}

/**
 *  判断文件是否存在
 */
- (BOOL)isFileExistWithFilePath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = FALSE;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

/**
 *  下载新图片
 */
- (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        NSString *filePath = [self getFilePathWithImageName:imageName]; // 保存文件的名称
        
        if ([data writeToFile:filePath atomically:YES]) {// 保存成功
//            NSLog(@"保存成功");
            [self deleteOldImage];
            [NSUserDefaults.standardUserDefaults setValue:imageName forKey:adImageName];
            [NSUserDefaults.standardUserDefaults synchronize];
            // 如果有广告链接，将广告链接也保存下来
        }else{
//            NSLog(@"保存失败");
        }
        
    });
}

/**
 *  删除旧图片
 */
- (void)deleteOldImage
{
    NSString *imageName = [NSUserDefaults.standardUserDefaults valueForKey:adImageName];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

/**
 *  根据图片名拼接文件路径
 */
- (NSString *)getFilePathWithImageName:(NSString *)imageName
{
    if (imageName) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *filePaht = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        return filePaht;
    }
    return nil;
}

//NotificationContants_Advertise_Key
- (void)adClick:(NSNotification *)noti
{
    NSString *url = @"https://baidu.com";
    if (!GGAdvertisingIsEmpty(url)) {
        if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{@"username" : @"njhu"} completionHandler:^(BOOL success) {
//                NSLog(@"%d", success);
            }];
        }
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotificationContants_Advertise_Key object:nil];
}

@end
