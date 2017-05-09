//
//  UIBarButtonItem+Category.m
//  QM_Nav_TabBar
//
//  Created by zyx on 16/12/24.
//  Copyright © 2016年 其妙. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

+ (UIBarButtonItem *)createItemWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor image:(UIImage *)image action:(void (^)(UIButton *button))action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
        action(sender);
    }];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
