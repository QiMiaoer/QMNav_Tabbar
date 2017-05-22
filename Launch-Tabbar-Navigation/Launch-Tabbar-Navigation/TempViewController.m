//
//  TempViewController.m
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/19.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@end

@implementation TempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(CGFloat)arc4random_uniform(256) / 255.0 green:(CGFloat)arc4random_uniform(256) / 255.0 blue:(CGFloat)arc4random_uniform(256) / 255.0 alpha:1.0];
}

@end
