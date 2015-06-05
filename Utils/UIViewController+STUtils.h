//
//  UIViewController+STUtils.h
//  STUtils
//
//  Created by zhenlintie on 15/6/4.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (STUtils)

@property (nonatomic, readonly) CGFloat width;
@property (nonatomic, readonly) CGFloat height;

- (BOOL)push:(UIViewController *)vc animated:(BOOL)animated;

@end
