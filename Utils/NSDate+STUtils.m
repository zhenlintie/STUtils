//
//  NSDate+STUtils.m
//  STUtils
//
//  Created by zhenlintie on 15/6/4.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import "NSDate+STUtils.h"

static NSMutableDictionary *_st_formatter_cache = nil;

NSDateFormatter *st_dateFormatter(NSString *formatter){
    if (!_st_formatter_cache){
        _st_formatter_cache = [NSMutableDictionary new];
    }
    if (formatter){
        NSDateFormatter *datef = _st_formatter_cache[formatter];
        if (!datef){
            datef = [NSDateFormatter new];
            datef.dateFormat = formatter;
            [_st_formatter_cache setObject:datef forKey:formatter];
        }
        return datef;
    }
    return nil;
}


// 当前时间的时间戳
extern NSString *st_timeStamp(){
    return st_timeStampFrom([NSDate date]);
}

// 指定时间的时间戳
extern NSString *st_timeStampFrom(NSDate *date){
    return [NSString stringWithFormat:@"%.f",[date timeIntervalSince1970]];
}

// 指定时间戳的时间
extern NSDate *st_dateFrom(NSString *timeStamp){
    return [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
}

#define STTTLongLongAgo     @"很久很久以前"
#define STTTOneCenturyAgo   @"一个世纪以前"
#define STTTYearsAgo        @"%d年前"
#define STTTHalfYearAgo     @"半年前"
#define STTTMonthsAgo       @"%d个月前"
#define STTTHalfMonthAgo    @"半个月前"
#define STTTWeekAgo         @"1周前"
#define STTTDaysAgo         @"%d天前"
#define STTTYesterday       @"昨天"
#define STTTHalfDayAgo      @"半天前"
#define STTTHoursAgo        @"%d小时前"
#define STTTHalfHourAgo     @"半小时前"
#define STTTMinutesAgo      @"%d分钟前"
#define STTTJustAmomentAgo  @"刚刚"
#define STTTInFuture        @"刚刚"//@"不久的将来";

#define STTTOneMinute       60
#define STTTOneHour         60*STTTOneMinute
#define STTTOneDay          24*STTTOneHour
#define STTTOneMonth        30*STTTOneDay
#define STTTOneYear         365*STTTOneDay

@implementation NSDate (STUtils)

- (NSDateFormatter *)timeFormatter{
    static NSDateFormatter *_st_timeFormatter = nil;
    if (!_st_timeFormatter){
        _st_timeFormatter = [[NSDateFormatter alloc] init];
        _st_timeFormatter.dateFormat = @"MM-dd HH:mm";
    }
    return _st_timeFormatter;
}

- (NSDateFormatter *)timeFormatterWithYear{
    static NSDateFormatter *_st_timeFormatterWithYear = nil;
    if (!_st_timeFormatterWithYear){
        _st_timeFormatterWithYear = [[NSDateFormatter alloc] init];
        _st_timeFormatterWithYear.dateFormat = @"YYYY-MM-dd HH:mm";
    }
    return _st_timeFormatterWithYear;
}

- (NSString *)timeTip{
    
    NSDate *newsDateFormatted = self;
    NSDate* current_date = [[NSDate alloc] init];
    
    NSTimeInterval time=[current_date timeIntervalSinceDate:newsDateFormatted];//间隔的秒数
    if (time < 0){
        return STTTInFuture;
    }
    int years = ((int)time)/STTTOneYear;
    int days=((int)time)/STTTOneDay;
    int hours=((int)time)/STTTOneHour;
    int minutes=((int)time)/STTTOneMinute;
    
    NSString *dateContent = [(0==years)?[self timeFormatter]:[self timeFormatterWithYear] stringFromDate:self];
    
    if (0 != days){
        if (1 == days){
            dateContent = STTTYesterday;
        }
        else if (days < 7){
            dateContent = [NSString stringWithFormat:STTTDaysAgo,days];
        }
        else if (7 == days){
            dateContent = STTTWeekAgo;
        }
    }
    else if (0 != hours){
        if (12 == hours){
            dateContent = STTTHalfDayAgo;
        }
        else{
            dateContent = [NSString stringWithFormat:STTTHoursAgo,hours];
        }
    }
    else if (0 != minutes){
        if (minutes>=30 && minutes<40){
            dateContent = STTTHalfHourAgo;
        }
        else{
            dateContent = [NSString stringWithFormat:STTTMinutesAgo,minutes];
        }
    }
    else if (time < STTTOneMinute){
        dateContent = STTTJustAmomentAgo;
    }
    
    return dateContent;
}


@end
