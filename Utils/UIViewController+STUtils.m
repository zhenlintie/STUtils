//
//  UIViewController+STUtils.m
//  STUtils
//
//  Created by zhenlintie on 15/6/4.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import "UIViewController+STUtils.h"

@implementation UIViewController (STUtils)

- (CGFloat)width{
    return CGRectGetWidth(self.view.frame);
}

- (CGFloat)height{
    return CGRectGetHeight(self.view.frame);
}

- (BOOL)push:(UIViewController *)vc animated:(BOOL)animated{
    if (self.navigationController){
        [self.navigationController pushViewController:vc animated:animated];
        return YES;
    }
    return NO;
}

@end

