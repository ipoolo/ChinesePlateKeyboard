//
//  PLInputCarPlateConfig.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/4.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "PLLInputCarPlateConfig.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation PLLInputCarPlateConfig

#pragma mark - resultView
+(UIColor *)resultViewColor{
    return UIColorFromRGB(0xff0000);
}
+(UIColor *)resultViewCellColor{
    return UIColorFromRGB(0xcc00cc);
}
+(UIColor *)resultViewCellSelectColor{
    return UIColorFromRGB(0xccffcc);
}
+(UIColor *)resultViewCellLabelNormalColor{
    return UIColorFromRGB(0x0000ff);
}
+(UIColor *)resultViewCellLabelHighlightColor{
    return UIColorFromRGB(0x00ffff);
}

#pragma mark - keyboardView
+(UIColor *)keyboardViewColor{
    return UIColorFromRGB(0x002200);
}
+(UIColor *)keyboardViewCellColor{
    return UIColorFromRGB(0x002222);
}
+(UIColor *)keyboardViewCellSelectColor{
    return UIColorFromRGB(0x222222);
}
+(UIColor *)keyboardViewCellLabelNormalColor{
    return UIColorFromRGB(0xff0022);
}
+(UIColor *)keyboardViewCellLabelHighlightColor{
    return UIColorFromRGB(0xff0055);
}
+(UIColor *)keyboardViewCellBackGroundImageViewNormalColor{
    return UIColorFromRGB(0x550055);
}
+(UIColor *)keyboardViewCellBackGroundImageViewHighlightColor{
     return UIColorFromRGB(0xffff55);
}

#pragma mark - containerView
+(UIColor *)containerViewBackgroundColor{
    return UIColorFromRGB(0xf00f55);
}

@end
