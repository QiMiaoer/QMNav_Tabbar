//
//  BaseViewController.m
//  QM_Nav_TabBar
//
//  Created by zyx on 16/12/22.
//  Copyright © 2016年 其妙. All rights reserved.
//

#import "BaseViewController.h"
#import "NextViewController.h"

#import "QMAlertView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    [self configNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configNav {
    [self.navigationController.navigationBar setBarBackgroundColor:[UIColor cyanColor]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem createItemWithTitle:@"背景" font:[UIFont systemFontOfSize:17] titleColor:[UIColor blackColor] image:nil action:^(UIButton *button) {
        self.view.backgroundColor = [UIColor whiteColor];
    }];
    self.navigationItem.rightBarButtonItems = @[[UIBarButtonItem createItemWithTitle:@"变色" font:[UIFont systemFontOfSize:10] titleColor:[UIColor redColor] image:nil action:^(UIButton *button) {
        [self.navigationController.navigationBar resetBarBackgroundColor];
    }] , [UIBarButtonItem createItemWithTitle:@"恢复" font:[UIFont systemFontOfSize:20] titleColor:[UIColor orangeColor] image:nil action:^(UIButton *button) {
        [self.navigationController.navigationBar resumeBarBackgroundColor];
    }]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.view bk_whenTapped:^{
        NextViewController *NVC = [NextViewController new];
        [NVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:NVC animated:YES];
    }];
    self.navigationItem.title = @"这就是一个标题而已，仅此而已";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor redColor]}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
