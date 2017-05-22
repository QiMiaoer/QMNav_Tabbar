//
//  UIImage+Category.m
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/19.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

+ (instancetype)getLaunchImage {
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSString *orientation = @"Portrait";
    NSString *launchImageName;
    NSArray *launchImages = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dic in launchImages) {
        CGSize imageSize = CGSizeFromString(dic[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, size) && [orientation isEqualToString:dic[@"UILaunchImageOrientation"]]) {
            launchImageName = dic[@"UILaunchImageName"];
        }
    }
    return [UIImage imageNamed:launchImageName];
}

@end
