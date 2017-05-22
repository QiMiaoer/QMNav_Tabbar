//
//  UITabBarItem+Category.m
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/19.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "UITabBarItem+Category.h"

@implementation UITabBarItem (Category)

+ (UITabBarItem *)createTabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    return [[UITabBarItem alloc] initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

+ (void)setTitleColor:(UIColor *)color selectedTitleColor:(UIColor *)selectedTitleColor {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:color} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectedTitleColor} forState:UIControlStateSelected];
}

- (void)setTitleOffsetWithH:(CGFloat)h v:(CGFloat)v {
    [self setTitlePositionAdjustment:UIOffsetMake(h, v)];
}

@end
