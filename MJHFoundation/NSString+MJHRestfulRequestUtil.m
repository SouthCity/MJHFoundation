//
//  NSString+MJHRestfulRequestUtil.m
//  YDHealthy
//
//  Created by chni on 16/8/16.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "NSString+MJHRestfulRequestUtil.h"
@implementation NSString (MJHRestfulRequestUtil)


//- (NSString *)appendParameterUrlForparameterArray:(NSArray *)array {
//    NSMutableArray *muParameterArray = [NSMutableArray arrayWithArray:array];
//    NSString *verifyTime = [NSDate getFormattedBeijingTime];
//    [muParameterArray addObject:YD_KO];
//   
//    [muParameterArray addObject:verifyTime];
//    
//    [muParameterArray  addObject:[[NSString stringWithFormat:@"%@%@",verifyTime,YD_SYS_CODE] MD5Hex]];
//    return [NSString stringWithFormat:@"%@/%@",self,[muParameterArray componentsJoinedByString:@"/"]];
//}
//
//- (NSString *)loginStateAppendParameterUrlForparameterArray:(NSArray *)array {
//    NSMutableArray *muParameterArray = [NSMutableArray arrayWithArray:array];
//    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userId"]) {
//        [muParameterArray addObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"userId"]];
//    }
//    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"loginCode"]) {
//        [muParameterArray addObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"loginCode"]];
//
//    }
//    
//    
//    NSString *verifyTime = [NSDate getFormattedBeijingTime];
//    [muParameterArray addObject:YD_KO];
//    
//    [muParameterArray addObject:verifyTime];
//    
//    [muParameterArray  addObject:[[NSString stringWithFormat:@"%@%@",verifyTime,YD_SYS_CODE] MD5Hex]];
//    return [NSString stringWithFormat:@"%@/%@",self,[muParameterArray componentsJoinedByString:@"/"]];
//}
//
- (NSString *)stringToUTF8String {
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
//
//- (NSString *)getInformationParameter {
//    NSMutableArray *muParameterArray = [NSMutableArray array];
//    NSString *verifyTime = [NSDate getFormattedBeijingTime];
//    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userId"]) {
//        [muParameterArray addObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"userId"]];
//
//    }
//    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"loginCode"]) {
//        [muParameterArray addObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"loginCode"]];
//    }
//    
//    [muParameterArray addObject:YD_KO];
//    
//    [muParameterArray addObject:verifyTime];
//    
//    [muParameterArray  addObject:[[NSString stringWithFormat:@"%@%@",verifyTime,YD_SYS_CODE] MD5Hex]];
//    return [NSString stringWithFormat:@"%@/%@",self,[muParameterArray componentsJoinedByString:@"/"]];
//
//}


@end
