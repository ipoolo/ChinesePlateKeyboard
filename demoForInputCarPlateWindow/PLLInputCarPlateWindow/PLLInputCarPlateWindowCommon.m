//
//  PLLInputCarPlateWindowCommon.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/4.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "PLLInputCarPlateWindowCommon.h"

@implementation PLLInputCarPlateWindowCommon
+(NSArray *)keyboardTypeProvinceArray{
    static NSArray* keyboardTypeProvinceArray;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        keyboardTypeProvinceArray = @[@"粤",@"京",@"津",@"晋",@"冀",@"蒙",@"辽",@"吉",@"黑",@"沪",@"苏",@"浙",@"皖",@"闽",@"赣",@"鲁",@"鄂",@"湘",@"桂",@"琼",@"川",@"贵",@"云",@"藏",@"陕",@"甘",@"青",@"宁",@"新",@"渝",@"V",@"Z",@"E",@"K",@"H",@"B",@"S",@"L",@"J",@"N",@"G",@"C",@"武"];
    });
    return keyboardTypeProvinceArray;

}

+(NSArray *)keyboardTypeCityArray{
    static NSArray* keyboardTypeCityArray;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        keyboardTypeCityArray = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    });
    return keyboardTypeCityArray;
}

+(NSArray *)keyboardTypeNormalPlateArray{
    static NSArray* keyboardTypeNormalPlateArray;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        keyboardTypeNormalPlateArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    });
    return keyboardTypeNormalPlateArray;
}

+(NSArray *)keyboardTypeLastPlateArray{
    static NSArray* keyboardTypeLastPlateArray;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        keyboardTypeLastPlateArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"警",@"学",@"领",@"试",@"挂",@"港",@"澳",@"超",@"使",@"练"];
    });
    return keyboardTypeLastPlateArray;
}

+(NSArray *)keyboardTypeArrayWithTag:(PLLInputKeyBoardTpyeTag) tag{

    switch (tag) {
        case PLLInputSelectKeyboardTypeCity:
            return [self keyboardTypeCityArray];
            break;
        case PLLInputSelectKeyboardTypeProvince:
            return [self keyboardTypeProvinceArray];
            break;
        case PLLInputSelectKeyboardTypeNormalPlate:
            return [self keyboardTypeNormalPlateArray];
            break;
        case PLLInputSelectKeyboardTypeLastPlate:
            return [self keyboardTypeLastPlateArray];
            break;

    }
}

@end
