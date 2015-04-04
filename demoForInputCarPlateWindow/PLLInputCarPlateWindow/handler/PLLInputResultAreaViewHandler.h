//
//  PLLInputResultAreaViewHandler.h
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PLLInputResultAreaViewHandlerDelegate <NSObject>
@required
-(void)resultSelectIndex:(NSUInteger)index;


@end

typedef void(^blk)(id,id);

@interface PLLInputResultAreaViewHandler : NSObject<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) blk setCellBlk;
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,strong) NSString* identifierStr;
@property (nonatomic,weak) id<PLLInputResultAreaViewHandlerDelegate> delegate;

+(instancetype)initDataHandleWithBlk:(blk)blk indentifiyStr:(NSString*)istr dataArray:(NSArray*)array;
-(void) selectIndex:(NSUInteger)index collectionView:(UICollectionView *) colletionView;
-(void) updateStr:(NSString *) str withIndex:(int) index collectionView:(UICollectionView *) colletionView;

@end
