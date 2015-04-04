//
//  PLLInputCarPlateWindowCommon.h
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/4.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PLLInputKeyBoardTpyeTag){
    PLLInputSelectKeyboardTypeProvince = 0,
    PLLInputSelectKeyboardTypeCity,
    PLLInputSelectKeyboardTypeNormalPlate,
    PLLInputSelectKeyboardTypeLastPlate,
};

@interface PLLInputCarPlateWindowCommon : NSObject

+(NSArray *)keyboardTypeArrayWithTag:(PLLInputKeyBoardTpyeTag) tag;

@end
