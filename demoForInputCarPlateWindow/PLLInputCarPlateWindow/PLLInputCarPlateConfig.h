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
+(UIColor *)resultViewColor;
+(UIColor *)resultViewCellColor;
+(UIColor *)resultViewCellSelectColor;
+(UIColor *)resultViewCellLabelNormalColor;
+(UIColor *)resultViewCellLabelHighlightColor;

#pragma mark - keyboardView
+(UIColor *)keyboardViewColor;
+(UIColor *)keyboardViewCellColor;
+(UIColor *)keyboardViewCellSelectColor;
+(UIColor *)keyboardViewCellLabelNormalColor;
+(UIColor *)keyboardViewCellLabelHighlightColor;
+(UIColor *)keyboardViewCellBackGroundImageViewNormalColor;
+(UIColor *)keyboardViewCellBackGroundImageViewHighlightColor;

#pragma mark - containerView
+(UIColor *)containerViewBackgroundColor;
@end
