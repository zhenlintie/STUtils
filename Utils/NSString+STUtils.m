//
//  NSString+STUtils.m
//  STUtils
//
//  Created by zhenlintie on 15/6/4.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import "NSString+STUtils.h"
#import <CommonCrypto/CommonCrypto.h>

BOOL st_stringIsEmpty(NSString *string){
    if (!string || [string isEqual:[NSNull null]] || [@"" isEqualToString:string]){
        return YES;
    }
//    else{
//        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//        return [@"" isEqualToString:[string stringByTrimmingCharactersInSet:set]];
//    }
    return NO;
}

NSString *st_killNil(NSString *str){
    if (!str){
        return @"";
    }
    return str;
}

NSString *st_stringFormat(NSString *format, ... ){
    NSString *theStrings = nil;
    if (format){
        va_list args;
        va_start(args, format);
        theStrings = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
    }
    return theStrings;
}

@implementation NSString (STUtils)

- (int)wordsCount{
    int i,l=0,a=0,b=0;
    NSUInteger n=[self length];
    unichar c;
    for(i=0;i<n;i++){
        c=[self characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    if (0 == l){
        return a+b;
    }
    return l+(int)ceilf((float)(a+b)/2.0);
}

- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

- (NSString *)stringForUrlEcode{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (CFStringRef)self,
                                                                                 NULL,
                                                                                 CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                 kCFStringEncodingUTF8));
}

- (NSString *)MD5
{
    const char *orgin_cstr = [self UTF8String];
    unsigned char result_cstr[CC_MD5_DIGEST_LENGTH];
    CC_MD5(orgin_cstr, (CC_LONG)strlen(orgin_cstr), result_cstr);
    NSMutableString *result_str = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result_str appendFormat:@"%02X", result_cstr[i]];
    }
    return [result_str lowercaseString];
}

- (NSString *)SHA1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}


@end
