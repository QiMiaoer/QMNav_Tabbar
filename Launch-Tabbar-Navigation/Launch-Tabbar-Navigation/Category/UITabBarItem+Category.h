//
//  UITabBarItem+Category.h
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/19.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (Category)

// 配置TabBarItem
+ (UITabBarItem *)createTabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
// 配置文字颜色
+ (void)setTitleColor:(UIColor *)color selectedTitleColor:(UIColor *)selectedTitleColor;
// 设置文字偏移量
- (void)setTitleOffsetWithH:(CGFloat)h v:(CGFloat)v;

@end
