//
//  MainTabBarController.m
//  QM_Nav_TabBar
//
//  Created by zyx on 16/12/27.
//  Copyright © 2016年 其妙. All rights reserved.
//

#import "MainTabBarController.h"

#import "BaseViewController.h"
#import "NextViewController.h"
#import "TestViewController.h"

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationController *B_Nav = [[UINavigationController alloc] initWithRootViewController:[BaseViewController new]];
    B_Nav.tabBarItem = [UITabBarItem createTabBarItemWithTitle:@"首页" image:kImageNamed(@"Home_0") selectedImage:kImageNamed(@"Home_1")];
    [B_Nav.tabBarItem setTitleOffsetWithH:0 v:-5];
    
    UINavigationController *C_Nav = [[UINavigationController alloc] initWithRootViewController:[NextViewController new]];
    C_Nav.tabBarItem = [UITabBarItem createTabBarItemWithTitle:@"课程" image:kImageNamed(@"Course_0") selectedImage:kImageNamed(@"Course_1")];
    [C_Nav.tabBarItem setTitleOffsetWithH:0 v:-3];
    
    UINavigationController *M_Nav = [[UINavigationController alloc] initWithRootViewController:[TestViewController new]];
    M_Nav.tabBarItem = [UITabBarItem createTabBarItemWithTitle:@"圈子" image:kImageNamed(@"Circle_0") selectedImage:kImageNamed(@"Circle_1")];
    [M_Nav.tabBarItem setTitleOffsetWithH:0 v:0];
    
    self.viewControllers = @[B_Nav , C_Nav , M_Nav];
    self.tabBar.barTintColor = [UIColor whiteColor];
    [UITabBarItem setTitleColor:kRGB16(0x000000) selectedTitleColor:kRGB16(0xdbb058)];
}

- (void)setBadgeValue:(NSString *)badgeValue index:(NSInteger)index {
    if (index + 1 > self.viewControllers.count || index < 0) {
        return;
    }
    UINavigationController *base = self.viewControllers[index];
    if (base.viewControllers.count == 0) {
        return;
    }
    UIViewController *vc = base.viewControllers[0];
    vc.tabBarItem.badgeValue = badgeValue.intValue > 0 ? badgeValue : nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
