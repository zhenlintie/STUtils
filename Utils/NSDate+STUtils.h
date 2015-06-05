//
//  NSDate+STUtils.h
//  STUtils
//
//  Created by zhenlintie on 15/6/4.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSDateFormatter *st_dateFormatter(NSString *formatter);

extern NSString *st_timeStamp();
// 指定时间的时间戳
extern NSString *st_timeStampFrom(NSDate *date);
// 指定时间戳的时间
extern NSDate *st_dateFrom(NSString *timeStamp);

@interface NSDate (STUtils)

- (NSString *)timeTip;

@end
