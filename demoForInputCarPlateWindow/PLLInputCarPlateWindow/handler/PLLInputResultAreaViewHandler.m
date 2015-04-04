//
//  PLLInputResultAreaViewHandler.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "PLLInputResultAreaViewHandler.h"

@implementation PLLInputResultAreaViewHandler

+ (instancetype)initDataHandleWithBlk:(blk)blk indentifiyStr:(NSString*)istr dataArray:(NSArray*)array{
    NSLog(@"%@",@"initDataHandleWithBlk");
    PLLInputResultAreaViewHandler* result = [[PLLInputResultAreaViewHandler alloc]init];
    result.setCellBlk = blk;
    result.identifierStr = istr;
    result.dataArray = array;
    
    return result;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identifierStr forIndexPath:indexPath];
    _setCellBlk([self objectInDataArrayAtIndex:indexPath],cell);
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataArray count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate resultSelectIndex:indexPath.row];
    return YES;
}

-(id)objectInDataArrayAtIndex:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.row];
}

-(void) selectIndex:(NSUInteger)index collectionView:(UICollectionView *) colletionView{
    [colletionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

-(void)updateStr:(NSString *) str withIndex:(int) index collectionView:(UICollectionView *) colletionView{
    NSMutableArray* mArray = [self.dataArray mutableCopy];
    [mArray replaceObjectAtIndex:index withObject:str];
    self.dataArray = mArray;
    [colletionView reloadData];
    [colletionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

@end
