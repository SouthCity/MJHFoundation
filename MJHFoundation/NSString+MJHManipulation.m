//
//  NSString+MJHManipulation.m
//  MJHBasicFramework
//
//  Created by chni on 2017/3/23.
//  Copyright © 2017年 孟家豪. All rights reserved.
//

#import "NSString+MJHManipulation.h"

@implementation NSString (MJHManipulation)

- (NSAttributedString *)commentsString:(NSString *)begin
                               endChar:(NSString *)end
                                 color:(UIColor *)fontColor{
    
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:fontColor
                                 };
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc]initWithString:self];
    int i=0;
    while (i<arrString.length-1) {
        i++;
        NSString *tempChar1 = [self substringWithRange:NSMakeRange(i-1, 1)];
        NSString *tempChar2 = [self substringWithRange:NSMakeRange(i, 1)];
        if ([tempChar1 isEqualToString:begin] && ![tempChar2 isEqualToString:begin]) {
            while (i<arrString.length) {
                tempChar2 = [self substringWithRange:NSMakeRange(i, 1)];
                if ([tempChar2 isEqualToString:end] || [tempChar2 isEqualToString:begin]) {
                    break;
                }
                 NSMutableAttributedString *temp = [[NSMutableAttributedString alloc]initWithString:tempChar2 attributes:attributes];
                [arrString replaceCharactersInRange:NSMakeRange(i, 1) withAttributedString:temp];
                i++;
            }
        }
    }
    return arrString;
}

@end
