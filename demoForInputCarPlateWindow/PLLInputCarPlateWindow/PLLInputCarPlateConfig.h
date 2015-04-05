//
//  PLInputCarPlateConfig.h
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/4.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PLLInputCarPlateConfig : NSObject

#pragma mark - resultView
+(UIColor *)resultViewBackgroundColor;
+(UIColor *)resultViewCellColor;
+(UIColor *)resultViewCellSelectedColor;
+(UIColor *)resultViewCellLabelNormalColor;
+(UIColor *)resultViewCellLabelHighlightColor;
+(int)resultViewCellNumberInEachLine;
+(CGFloat)resultViewInteritemSpacing;
+(CGFloat)resultViewLineSpacing;

#pragma mark - keyboardView
+(UIColor *)keyboardViewBackgroundColor;
+(UIColor *)keyboardViewCellLabelNormalColor;
+(UIColor *)keyboardViewCellLabelHighlightColor;
+(UIImage *)keyboardViewCellBackGroundImageViewNormalImage;
+(UIImage *)keyboardViewCellBackGroundImageViewHighlightImage;
+(int)keyboardViewCellNumberInEachLine;
+(CGFloat)keyboardViewInteritemSpacing;
+(CGFloat)keyboardViewLineSpacing;
+(int)keyboardViewDisplayRow;

#pragma mark - containerView
+(UIColor *)containerViewBackgroundColor;

+(CGFloat)coverViewAlpha;
+(CGFloat)spacingBetweenResultViewWihtKeyboardView;
+(NSString*)nullMarkStr;
@end
