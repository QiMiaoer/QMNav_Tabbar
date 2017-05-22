//
//  UIButton+Category.h
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/20.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ButtonTitleImagePositionTypeTitleRightImageLeft,        // 右标题左图片，默认
    ButtonTitleImagePositionTypeTitleLeftImageRight,        // 左标题右图片
    ButtonTitleImagePositionTypeTitleTopImageBottom,        // 上标题下图片
    ButtonTitleImagePositionTypeTitleBottomImageTop         // 下标题上图片
} ButtonTitleImagePositionType;

@interface UIButton (Category)

/**
 按钮标题图片排列方式

 @param positionType 排列方式
 @param margin 标题图片间距
 */
- (void)setButtonTitleImagePositionType:(ButtonTitleImagePositionType)positionType margin:(CGFloat)margin;

@end
