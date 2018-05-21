//
//  GGAnimationNavBarViewController.m
//  GG_iOSProject
//
//  Created by Mac on 2018/5/21.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGAnimationNavBarViewController.h"
#import "GGWordArrowItem.h"
#import "GGItemSection.h"

@interface GGAnimationNavBarViewController ()

@end

@implementation GGAnimationNavBarViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self scrollViewDidScroll:self.tableview];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffsetY = self.tableview.contentOffset.y + self.tableview.contentInset.top;
    if (contentOffsetY == 0) {
        [UIView animateWithDuration:0.2 animations:^{
            self.gg_navgationBar.transform = CGAffineTransformMakeTranslation(0, 0);
            self.gg_navgationBar.backgroundColor = [UIColor clearColor];
            self.gg_navgationBar.gg_height = [self gg_navgationHeight:nil];
        }];
    }else if (contentOffsetY <0){
        [UIView animateWithDuration:0.2 animations:^{
            self.gg_navgationBar.transform = CGAffineTransformMakeTranslation(0, -[self gg_navgationHeight:nil]);
            self.gg_navgationBar.backgroundColor = [UIColor clearColor];
        }];
    }else if (contentOffsetY >0){
        [UIView animateWithDuration:0.2f animations:^{
            self.gg_navgationBar.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
        
        UIColor *redColor = [self gg_navigationBackgroundColor:nil];
        
        redColor = [redColor colorWithAlphaComponent:((contentOffsetY/([self gg_navgationHeight:nil]+CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))*0.2*0.63))];
        
        self.gg_navgationBar.gg_height = [self gg_navgationHeight:nil];
        
        self.gg_navgationBar.backgroundColor = redColor;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableview.backgroundColor = [UIColor whiteColor];
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    
    return cell;
    
}

#pragma mark 重写BaseViewController设置内容

- (UIColor *)gg_navigationBackgroundColor:(GGNavigatrionBar *)navigationbar{
    return [[UIColor purpleColor] colorWithAlphaComponent:0.63];
}

- (BOOL)gg_navigationIsHideBottomLine:(GGNavigatrionBar *)navigationbar{
    return YES;
}

@end
