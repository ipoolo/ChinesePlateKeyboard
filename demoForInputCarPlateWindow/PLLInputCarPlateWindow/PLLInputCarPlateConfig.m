//
//  PLInputCarPlateConfig.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/4.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "PLLInputCarPlateConfig.h"
#import "UIImage+WattImageFromUIColor.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation PLLInputCarPlateConfig

#pragma mark - resultView
+(UIColor *)resultViewBackgroundColor{
    return UIColorFromRGB(0x007500);
}
+(UIColor *)resultViewCellColor{
    return UIColorFromRGB(0xcc00cc);
}
+(UIColor *)resultViewCellSelectedColor{
    return UIColorFromRGB(0xccffcc);
}
+(UIColor *)resultViewCellLabelNormalColor{
    return UIColorFromRGB(0x0000ff);
}
+(UIColor *)resultViewCellLabelHighlightColor{
    return UIColorFromRGB(0x00ffff);
}

#pragma mark - keyboardView
+(UIColor *)keyboardViewBackgroundColor{
    return UIColorFromRGB(0x002200);
}
+(UIColor *)keyboardViewCellLabelNormalColor{
    return UIColorFromRGB(0xFFFF00);
}
+(UIColor *)keyboardViewCellLabelHighlightColor{
    return UIColorFromRGB(0xFFFFFF);
}
+(UIImage *)keyboardViewCellBackGroundImageViewNormalImage{
    static UIImage *keyboardViewCellBackGroundImageViewNormalImage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        keyboardViewCellBackGroundImageViewNormalImage = [UIImage wattimageFromUicolor:UIColorFromRGB(0x550055)];
    });

    return keyboardViewCellBackGroundImageViewNormalImage;
}

+(UIImage *)keyboardViewCellBackGroundImageViewHighlightImage{
    static UIImage *keyboardViewCellBackGroundImageViewHighlightImage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        keyboardViewCellBackGroundImageViewHighlightImage = [UIImage wattimageFromUicolor:UIColorFromRGB(0x55FF55)];
    });
    
     return keyboardViewCellBackGroundImageViewHighlightImage;
}

#pragma mark - containerView
+(UIColor *)containerViewBackgroundColor{
    return UIColorFromRGB(0x001255);
}

@end
