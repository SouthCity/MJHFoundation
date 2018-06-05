//
//  UIView+MJHView.m
//  MJHFoundation
//
//  Created by cocoa on 2018/6/5.
//

#import "UIView+MJHView.h"

@implementation UIView (MJHView)

+ (UIView *)buildNavTitleView:(NSString *)title {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 46)];
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 46)];
    titleLabel.text = title;
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    titleLabel.font=[UIFont systemFontOfSize:20];
    [view addSubview:titleLabel];
    return view;
}

+ (UIView *)buildNavImageView:(NSString *)imageName {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 46)];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-34, 7, 68, 33)];
    [imageView setImage:[UIImage imageNamed:imageName]];
    [view addSubview:imageView];
    return view;
}

@end
