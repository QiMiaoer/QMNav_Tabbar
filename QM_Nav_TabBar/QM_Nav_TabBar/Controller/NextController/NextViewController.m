//
//  NextViewController.m
//  QM_Nav_TabBar
//
//  Created by zyx on 16/12/24.
//  Copyright © 2016年 其妙. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_interactivePopDisabled = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"课程";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem createItemWithTitle:nil font:nil titleColor:nil image:[UIImage imageNamed:@"icon"] action:^(UIButton *button) {
        NSLog(@"click !!!");
    }];
    
    [self.view bk_whenTapped:^{
        self.tabBarController.selectedIndex = 2;
    }];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"首页" , @"课程" , @"圈子"]];
    seg.frame = CGRectMake(0, 0, 200, 30);
    seg.tintColor = kRGB16(0xdbb058);
    seg.selectedSegmentIndex = 0;
    [[seg rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(UISegmentedControl *seg) {
        NSLog(@"%ld" , seg.selectedSegmentIndex);
    }];
    self.navigationItem.titleView = seg;
    
    [self addButton];
}

- (void)addButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"click me !!!" forState:UIControlStateNormal];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
//        [alertView setContainerView:[self createView]];
//        [alertView show];
        [self createView];
        [self.navigationController.tabBarItem setBadgeValue:@"8"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController.tabBarItem setBadgeValue:nil];
        });
    }];
    [self.view addSubview:button];
    
    button.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.navigationController.navigationBar, 50)
    .widthIs(100)
    .heightIs(30);
}

- (UIView *)createView {
    UIView *view = [UIView new];
    view.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5f];
    [self.view addSubview:view];
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"test test test !!!";
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    
    CGFloat space = 15;
    
    view.sd_layout
    .leftSpaceToView(self.view, space*3)
    .rightSpaceToView(self.view, space*3)
    .topSpaceToView(self.navigationController.navigationBar, space*10)
    .heightIs(50);
    [view setSd_cornerRadiusFromHeightRatio:@0.5];
    
    label.sd_layout
    .centerXEqualToView(view)
    .centerYEqualToView(view)
    .widthIs(space*10)
    .heightIs(30);
    
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
