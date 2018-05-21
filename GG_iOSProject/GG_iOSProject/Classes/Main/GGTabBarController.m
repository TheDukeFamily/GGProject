//
//  LMJTabBarController.m
//  PLMMPRJK
//
//  Created by HuXuPeng on 2017/4/6.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import "GGTabBarController.h"
#import "GGNavigationController.h"
#import "GGHomeViewController.h"
#import "GGNewViewController.h"
#import "GGMessageViewController.h"
#import "GGCasesViewController.h"

@interface GGTabBarController ()<UITabBarControllerDelegate>

@end

@implementation GGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor redColor];
    [self setValue:[NSValue valueWithUIOffset:UIOffsetMake(0, -3)] forKeyPath:GGKeyPath(self, titlePositionAdjustment)];
    [self addTabarItems];
    [self addChildViewControllers];
    self.delegate = self;
}


- (void)addChildViewControllers
{
    GGNavigationController *one = [[GGNavigationController alloc] initWithRootViewController:[[GGHomeViewController alloc] init]];
    
    GGNavigationController *two = [[GGNavigationController alloc] initWithRootViewController:[[GGNewViewController alloc] init]];
    
    GGNavigationController *three = [[GGNavigationController alloc] initWithRootViewController:[[GGMessageViewController alloc] init]];
    
    GGNavigationController *four = [[GGNavigationController alloc] initWithRootViewController:[[GGCasesViewController alloc] init]];
    
    self.viewControllers = @[one, two, three, four];
    
}

- (void)addTabarItems
{
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"基础",
                                                 CYLTabBarItemImage : @"tabBar_essence_icon",
                                                 CYLTabBarItemSelectedImage : @"tabBar_essence_click_icon",
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"预演",
                                                 CYLTabBarItemImage : @"tabBar_friendTrends_icon",
                                                 CYLTabBarItemSelectedImage : @"tabBar_friendTrends_click_icon",
                                                 };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"实例",
                                                 CYLTabBarItemImage : @"tabBar_new_icon",
                                                 CYLTabBarItemSelectedImage : @"tabBar_new_click_icon",
                                                 };
    NSDictionary *fifthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"更多",
                                                  CYLTabBarItemImage : @"tabbar_discover",
                                                  CYLTabBarItemSelectedImage : @"tabbar_discover_highlighted"
                                                  };
    self.tabBarItemsAttributes = @[    secondTabBarItemsAttributes,
                                       firstTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fifthTabBarItemsAttributes
                                       ];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

@end
