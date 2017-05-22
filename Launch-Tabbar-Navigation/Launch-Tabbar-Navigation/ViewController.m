//
//  ViewController.m
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/19.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "ViewController.h"
#import "AdView.h"
#import "Tabbar1Controller.h"
#import "Tabbar2Controller.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    NSLog(@"%f", CACurrentMediaTime());
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    AdView *view = [[AdView alloc] initWithAdImageUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495175628323&di=76ee7b36595c43eeabf8161cd3b73137&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201507%2F30%2F20150730163204_A24MX.thumb.700_0.jpeg"
                                            duration:10
                                      adImageClick:^{
                                          NSLog(@"我要看广告，跳转吧");
                                      } endDisplay:^{
                                          NSLog(@"广告页消失了");
                                          NSLog(@"%f", CACurrentMediaTime());
                                      }];
    [[UIApplication sharedApplication].keyWindow addSubview:view];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"tabbar style %ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[Tabbar1Controller new] animated:YES];
    } else {
        [self.navigationController pushViewController:[Tabbar2Controller new] animated:YES];
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
    }
    return _tableView;
}

@end
