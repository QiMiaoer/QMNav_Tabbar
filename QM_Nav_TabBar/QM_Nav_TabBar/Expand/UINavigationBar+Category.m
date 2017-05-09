//
//  UINavigationBar+Category.m
//  QM_Nav_TabBar
//
//  Created by zyx on 16/12/22.
//  Copyright © 2016年 其妙. All rights reserved.
//

#import "UINavigationBar+Category.h"
#import <objc/runtime.h>

@implementation UINavigationBar (Category)
static char overlayKey;

- (void)setBarBackgroundColor:(UIColor *)backgroundColor {
    UIView *barBackgroundView = (UIView *)objc_getAssociatedObject(self, &overlayKey);
    if (!barBackgroundView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        barBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.bounds.size.width, self.bounds.size.height + 20)];
        barBackgroundView.userInteractionEnabled = NO;
        barBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.shadowImage = [self getImageWithColor:[UIColor clearColor]];
        objc_setAssociatedObject(self, &overlayKey, barBackgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self insertSubview:barBackgroundView atIndex:0];
    }
    barBackgroundView.backgroundColor = backgroundColor;
}

- (void)resetBarBackgroundColor {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.shadowImage = nil;
    [((UIView *)objc_getAssociatedObject(self, &overlayKey)) removeFromSuperview];
}

- (void)resumeBarBackgroundColor {
    UIView *barBackgroundView = (UIView *)objc_getAssociatedObject(self, &overlayKey);
    if (barBackgroundView && !barBackgroundView.superview) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = [self getImageWithColor:[UIColor clearColor]];
        [self insertSubview:barBackgroundView atIndex:0];
    }
}

- (UIImage *)getImageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContext(CGRectMake(0, 0, 1, 1).size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
