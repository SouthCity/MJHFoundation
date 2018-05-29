//
//  NSString+MJHManipulation.h
//  MJHBasicFramework
//
//  Created by chni on 2017/3/23.
//  Copyright © 2017年 孟家豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MJHManipulation)



/**
 改变字符串中指定两字符间字符串的颜色

 @param begin 开始字符
 @param end 结束字符
 @param fontColor 颜色
 @return NSAttributedString
 */
- (NSAttributedString *)commentsString:(NSString *)begin
                               endChar:(NSString *)end
                                 color:(UIColor *)fontColor;

@end
