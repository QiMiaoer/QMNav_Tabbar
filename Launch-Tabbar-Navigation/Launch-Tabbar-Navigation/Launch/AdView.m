//
//  AdView.m
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/19.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "AdView.h"
#import "UIImage+Category.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation AdView {
    UIButton *_skipButton;
    NSString *_imageUrl;
    NSInteger _duration;
    dispatch_block_t _click;
    dispatch_block_t _end;
    
    dispatch_source_t _timer;
}

- (instancetype)initWithAdImageUrl:(NSString *)url duration:(NSInteger)duration adImageClick:(dispatch_block_t)click endDisplay:(dispatch_block_t)end {
    if (self == [super initWithFrame:[UIScreen mainScreen].bounds]) {
        _imageUrl = url;
        _duration = duration;
        _click = click;
        _end = end;
        [self setupUI];
        [self setupTimer];
    }
    return self;
}

- (void)setupTimer {
    __weak typeof(self) weakSelf = self;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [_skipButton setTitle:[NSString stringWithFormat:@"%lds 跳过", _duration] forState:UIControlStateNormal];
            if (_duration == 0) {
                dispatch_source_cancel(timer);
                [weakSelf skipAction];
            }
            _duration--;
        });
    });
    dispatch_resume(timer);
    _timer = timer;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage getLaunchImage]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width + 50)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrl]];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [imageView addGestureRecognizer:tap];
    [self addSubview:imageView];

    UIButton *skipBtn = [UIButton new];
    skipBtn.frame = CGRectMake(self.bounds.size.width - 70, 30, 60, 30);
    skipBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    skipBtn.layer.cornerRadius = 15;
    skipBtn.layer.masksToBounds = YES;
    skipBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [skipBtn addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:skipBtn];
    _skipButton = skipBtn;
}

- (void)skipAction {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(1.5, 1.5);
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        if (_end) {
            _end();
        }
        dispatch_source_cancel(_timer);
        [weakSelf removeFromSuperview];
    }];
}

- (void)tapAction {
    if (_click) {
        _click();
    }
}

@end
