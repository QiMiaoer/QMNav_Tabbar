//
//  TabbarCustom.m
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/20.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "TabbarCustom.h"
#import "UIButton+Category.h"

@implementation TabbarCustom {
    UIButton *_midButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat itemWidth = self.bounds.size.width / 5;
    UIButton *midBtn = [UIButton new];
    midBtn.frame = CGRectMake(0, 0, itemWidth, 70);
    midBtn.center = CGPointMake(self.center.x, 12);
    [midBtn setImage:[UIImage imageNamed:@"tabar_plus_normal"] forState:UIControlStateNormal];
    [midBtn setTitle:@"发布" forState:UIControlStateNormal];
    [midBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    midBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [midBtn addTarget:self action:@selector(midClick) forControlEvents:UIControlEventTouchUpInside];
    midBtn.adjustsImageWhenHighlighted = NO;
    [midBtn setButtonTitleImagePositionType:ButtonTitleImagePositionTypeTitleBottomImageTop margin:5];
    [self addSubview:midBtn];
    _midButton = midBtn;
    
    NSMutableArray *tabBarButtons = [NSMutableArray array];
    for (id subview in self.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtons addObject:subview];
        }
    }
    
    int j = 0;
    for (int i = 0; i < tabBarButtons.count; i++) {
        UIView *v = tabBarButtons[i];
        if (i > 1) {
            j = 1;
        }
        v.frame = CGRectMake(itemWidth * (i + j), v.frame.origin.y, itemWidth, v.frame.size.height);
    }
}

- (void)midClick {
    if (self.midCallback) {
        self.midCallback();
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden) {
        return [super hitTest:point withEvent:event];
    } else {
        CGPoint newPoint = [self convertPoint:point toView:_midButton];
        if ([_midButton pointInside:newPoint withEvent:event]) {
            return _midButton;
        } else {
            return [super hitTest:point withEvent:event];
        }
    }
}

@end
