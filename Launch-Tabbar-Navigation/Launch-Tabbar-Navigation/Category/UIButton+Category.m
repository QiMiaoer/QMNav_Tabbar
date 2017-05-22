//
//  UIButton+Category.m
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/20.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

- (void)setButtonTitleImagePositionType:(ButtonTitleImagePositionType)positionType margin:(CGFloat)margin {
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    CGSize titleSize = ([self titleForState:UIControlStateNormal].length >0) ? [[self titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}] : CGSizeZero;
    
    switch (positionType) {
        case ButtonTitleImagePositionTypeTitleRightImageLeft:
            self.titleEdgeInsets = UIEdgeInsetsMake(0, margin, 0, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, margin);
            break;
        case ButtonTitleImagePositionTypeTitleLeftImageRight:
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width + margin);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + margin, 0, -titleSize.width);
            break;
        case ButtonTitleImagePositionTypeTitleBottomImageTop:
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(imageSize.height + margin), 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + margin), 0, 0, -titleSize.width);
            break;
        case ButtonTitleImagePositionTypeTitleTopImageBottom:
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageSize.height + margin), -imageSize.width, 0, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -(titleSize.height + margin), -titleSize.width);
            break;
    }
}

@end
