//
//  PLLInputKeyboardAreaViewHandler.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "PLLInputKeyboardAreaViewHandler.h"

@implementation PLLInputKeyboardAreaViewHandler


+(instancetype)initDataHandleWithBlk:(blk)blk indentifiyStr:(NSString*)istr keyboardTypeTag:(PLLInputKeyBoardTpyeTag) tag{
    NSLog(@"%@",@"initDataHandleWithBlk");
    PLLInputKeyboardAreaViewHandler* result = [[PLLInputKeyboardAreaViewHandler alloc]init];
    result.setCellBlk = blk;
    result.identifierStr = istr;
    result.dataArray = [PLLInputCarPlateWindowCommon keyboardTypeArrayWithTag:tag];
    
    return result;
}

-(void)changeKeyBoardTypeToType:(PLLInputKeyBoardTpyeTag) tag withCollectionView:(UICollectionView*) collectionview{
    self.dataArray = [PLLInputCarPlateWindowCommon keyboardTypeArrayWithTag:tag];
    [collectionview reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identifierStr forIndexPath:indexPath];
    //TODO: 修改颜色
    _setCellBlk([self objectInDataArrayAtIndex:indexPath],cell);
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataArray count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate keyboardClickStr:[self objectInDataArrayAtIndex:indexPath]];
}

-(id)objectInDataArrayAtIndex:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.row];
}

@end
