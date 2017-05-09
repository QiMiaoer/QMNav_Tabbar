//
//  UIBarButtonItem+Category.h
//  QM_Nav_TabBar
//
//  Created by zyx on 16/12/24.
//  Copyright © 2016年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)
// 配置BarButtonItem
+ (UIBarButtonItem *)createItemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor image:(UIImage *)image action:(void (^)(UIButton *button))action;

@end
