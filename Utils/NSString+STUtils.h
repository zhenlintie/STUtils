//
//  NSString+STUtils.h
//  STUtils
//
//  Created by zhenlintie on 15/6/4.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import <Foundation/Foundation.h>

// 如果是nil，转换为空字符串
extern NSString *st_killNil(NSString *str);

// 判断字符串是否为空，包括空字符，nil，null
extern BOOL st_stringIsEmpty(NSString *str);

// 将空字符串转换为指定字符串
extern NSString *st_emptyToStr(NSString *oriStr, NSString *str);
static inline NSString *st_emptyTo0(NSString *str){
    return st_emptyToStr(str, @"0");
}

// 格式化字符
extern NSString *st_stringFormat(NSString *format, ... )NS_FORMAT_FUNCTION(1,2);

@interface NSString (STUtils)

- (int)wordsCount;// 字符数
- (BOOL)isPureInt;//是否为int
- (BOOL)isPureFloat;//是否为小数

- (NSString *)stringForUrlEcode;
- (NSString *)MD5;
- (NSString *)SHA1;

@end
