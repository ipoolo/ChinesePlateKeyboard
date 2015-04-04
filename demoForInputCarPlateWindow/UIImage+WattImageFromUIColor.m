//
//  UIImage+WattImageFromUIColor.m
//  PLUnit
//
//  Created by liu poolo on 15/4/4.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "UIImage+WattImageFromUIColor.h"

@implementation UIImage (WattImageFromUIColor)
+(UIImage *)wattimageFromUicolor:(UIColor *)color{
    UIGraphicsBeginImageContext(CGSizeMake(1, 1));
    CGContextRef ct = UIGraphicsGetCurrentContext();
    CGContextAddRect(ct, CGRectMake(0, 0, 1, 1));
    [color setFill];
    CGContextDrawPath(ct, kCGPathFill);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

@end
