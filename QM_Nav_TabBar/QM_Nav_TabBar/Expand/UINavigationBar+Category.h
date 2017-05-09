//
//  UINavigationBar+Category.h
//  QM_Nav_TabBar
//
//  Created by zyx on 16/12/22.
//  Copyright © 2016年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Category)
// 设置背景色
- (void)setBarBackgroundColor:(UIColor *)backgroundColor;
// 重置背景色
- (void)resetBarBackgroundColor;
// 回复背景色
- (void)resumeBarBackgroundColor;

@end
