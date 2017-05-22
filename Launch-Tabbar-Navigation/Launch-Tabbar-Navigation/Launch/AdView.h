//
//  AdView.h
//  Launch-Tabbar-Navigation
//
//  Created by zyx on 17/5/19.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdView : UIView

- (instancetype)initWithAdImageUrl:(NSString *)url duration:(NSInteger)duration adImageClick:(dispatch_block_t)click endDisplay:(dispatch_block_t)end;

@end
