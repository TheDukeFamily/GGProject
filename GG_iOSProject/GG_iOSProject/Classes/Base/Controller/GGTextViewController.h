//
//  GGTextViewController.h
//  GG_iOSProject
//
//  Created by Mac on 2018/5/18.
//  Copyright © 2018年 Mr.Gao. All rights reserved.
//

#import "GGNavUIBaseViewController.h"

@class GGTextViewController;

@protocol GGTextViewControllerDataSource <NSObject>

@optional
/** 键盘ReturnKeyType **/
- (UIReturnKeyType)textViewControllerLastReturnKeyType:(GGTextViewController *)textViewController;
/** 是否使用键盘工具栏 */
- (BOOL)textViewControllerEnableAutoToolbar:(GGTextViewController *)textViewController;
/** 控制是否可以点击点击的按钮 */
- (NSArray <UIButton *> *)textViewControllerRelationButtons:(GGTextViewController *)textViewController;
@end

@protocol GGTextViewControllerDelegate <UITextViewDelegate,UITextFieldDelegate>

@optional
/** 最后一个输入框点击键盘上的完成按钮时调用 */
- (void)textViewController:(GGTextViewController *)textViewController inputViewDone:(id)inputView;
@end


@interface GGTextViewController : GGNavUIBaseViewController<GGTextViewControllerDelegate,GGTextViewControllerDataSource>

// "NS_REQUIRES_SUPER" 用来修饰所有方法，表示子类覆盖父类的方法时，必须在方法内部调用父类的这个方法。

- (BOOL)textFieldShouldClear:(UITextField *)textField NS_REQUIRES_SUPER;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string NS_REQUIRES_SUPER;
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_REQUIRES_SUPER;
- (BOOL)textFieldShouldReturn:(UITextField *)textField NS_REQUIRES_SUPER;

@end

#pragma mark - 设计 UITextField
IB_DESIGNABLE //让你的自定 UIView 可以在 IB 中预览。
@interface UITextField (GGTextViewController)

@property (assign, nonatomic) IBInspectable BOOL isEmptyAutoEnable;

@end

@interface GGTextViewControllerTextField : UITextField

@end
