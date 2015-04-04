//
//  PLLInputKeyboardAreaViewHandler.h
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLLInputCarPlateWindowCommon.h"
#import <UIKit/UIKit.h>

@protocol PLLInputKeyboardAreaViewHandlerDelegate <NSObject>
@required
-(void)keyboardClickStr:(NSString *)str;

typedef void(^blk)(id,id);

@end
@interface PLLInputKeyboardAreaViewHandler : NSObject<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) blk setCellBlk;
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,strong) NSString* identifierStr;
@property (nonatomic,weak) id<PLLInputKeyboardAreaViewHandlerDelegate> delegate;

+(instancetype)initDataHandleWithBlk:(blk)blk indentifiyStr:(NSString*)istr keyboardTypeTag:(PLLInputKeyBoardTpyeTag) tag;
-(void)changeKeyBoardTypeToType:(PLLInputKeyBoardTpyeTag) tag withCollectionView:(UICollectionView*) collectionview;

@end
