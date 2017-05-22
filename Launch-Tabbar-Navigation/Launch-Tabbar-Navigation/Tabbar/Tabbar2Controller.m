//
//  Tabbar2Controller.m
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/19.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "Tabbar2Controller.h"
#import "TempViewController.h"
#import "UITabBarItem+Category.h"
#import "TabbarCustom.h"
#import "NavigationViewController.h"

#define kRGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface Tabbar2Controller ()

@end

@implementation Tabbar2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TabbarCustom *tabBar = [TabbarCustom new];
    tabBar.midCallback = ^{
        NSLog(@"click me");
    };
    [self setValue:tabBar forKey:@"tabBar"];
    
    NSArray *sourceArray = @[@{@"vcClsName": @"TempViewController", @"title": @"首页", @"image": @"home_menu_home"},
                             @{@"vcClsName": @"TempViewController", @"title": @"课程", @"image": @"home_menu_kecheng"},
                             @{@"vcClsName": @"TempViewController", @"title": @"圈子", @"image": @"home_menu_quanzi"},
                             @{@"vcClsName": @"TempViewController", @"title": @"我的", @"image": @"home_menu_my"}];
    
    NSMutableArray *vcs = [NSMutableArray array];
    for (NSDictionary *dic in sourceArray) {
        [vcs addObject:[self createVCWithDic:dic]];
    }
    self.viewControllers = vcs;
    self.tabBar.barTintColor = [UIColor whiteColor];
    [UITabBarItem setTitleColor:kRGB16(0x000000) selectedTitleColor:kRGB16(0xdbb058)];
}

- (UIViewController *)createVCWithDic:(NSDictionary *)dic {
    Class cls = NSClassFromString(dic[@"vcClsName"]);
    NSString *title = dic[@"title"];
    NSString *image = dic[@"image"];
    
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:[cls new]];
    nav.tabBarItem = [UITabBarItem createTabBarItemWithTitle:title image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:[image stringByAppendingString:@"_seleted"]]];
    [nav.tabBarItem setTitleOffsetWithH:0 v:1];
    
    return nav;
}

#pragma mark --- 添加点击动画
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    NSMutableArray *tabbarButtons = [NSMutableArray array];
    for (id tabbarButton in self.tabBar.subviews) {
        if ([tabbarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarButtons addObject:tabbarButton];
        }
    }
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = 0.2;
    anim.repeatCount = 1;
    anim.autoreverses = YES;
    anim.fromValue = [NSNumber numberWithFloat:0.8];
    anim.toValue = [NSNumber numberWithFloat:1.2];
    [[tabbarButtons[index] layer] addAnimation:anim forKey:nil];
}

@end
