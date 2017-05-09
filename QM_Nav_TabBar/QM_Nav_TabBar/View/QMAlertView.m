//
//  QMAlertView.m
//  QM_Nav_TabBar
//
//  Created by zyx on 17/1/10.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "QMAlertView.h"

@implementation QMAlertView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor orangeColor];
        [self layoutUI];
    }
    return self;
}

- (void)layoutUI {
    UILabel *label = [UILabel new];
    label.text = @"test";
    [self addSubview:label];
    
    label.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .widthIs(50)
    .heightIs(0);
}

+ (UIView *)alertView {
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 200)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 270, 180)];
    [imageView setImage:[UIImage imageNamed:@"demo"]];
    [demoView addSubview:imageView];
    
    return demoView;
//    return [[self alloc] init];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
