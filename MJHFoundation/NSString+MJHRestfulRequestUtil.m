//
//  NSString+MJHRestfulRequestUtil.m
//  YDHealthy
//
//  Created by chni on 16/8/16.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "NSString+MJHRestfulRequestUtil.h"
@implementation NSString (MJHRestfulRequestUtil)


- (NSString *)stringToUTF8String {
    return [self stringByRemovingPercentEncoding];
}



@end
