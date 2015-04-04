//
//  PLLInputCarPlateWindow.h
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PLLInputCarPlateWindowDelegate <NSObject>
@required
-(void)resultPlateStr:(NSString *)str;

@end

@interface PLLInputCarPlateWindow : UIWindow

@property (nonatomic,strong) UIView *coverView;
@property (nonatomic,strong) UIView *containtView;

@property (nonatomic,strong) UICollectionView *resultAreaView;
@property (nonatomic,strong) UICollectionView *keyboardAreaView;

@property (nonatomic,weak) id<PLLInputCarPlateWindowDelegate> resultDelegate;

+ (instancetype)shareInputCarPlateWindow;


- (void)setPlateStr:(NSString*)str;
- (PLLInputCarPlateWindow* )showWithPlateStr:(NSString*) str;
- (void)hide;

@end
