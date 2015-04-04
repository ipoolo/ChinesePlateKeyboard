//
//  PLLInputCarPlateWindow.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "PLLInputCarPlateWindow.h"

#import "PLLResultAreaCellCollectionViewCell.h"
#import "PLLKeyBoardAreaCollectionViewCell.h"
#import "PLLInputResultAreaViewHandler.h"
#import "PLLInputKeyboardAreaViewHandler.h"
#import "PLLInputCarPlateConfig.h"

@interface PLLInputCarPlateWindow()<PLLInputResultAreaViewHandlerDelegate,PLLInputKeyboardAreaViewHandlerDelegate>
{
    
}

@property (nonatomic,strong) NSLayoutConstraint *containViewHeightConstatint;
@property (nonatomic,copy) NSArray *arrayPlate;

@property (nonatomic,strong) PLLInputResultAreaViewHandler* inputResultAreaViewHandler;
@property (nonatomic,strong) PLLInputKeyboardAreaViewHandler* inputKeyboardAreaViewHandler;

@property (nonatomic,assign) BOOL indexAddFlag;

@end

@implementation PLLInputCarPlateWindow

+ (instancetype)shareInputCarPlateWindow{
    static PLLInputCarPlateWindow* shareInputCarPlateWindow;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInputCarPlateWindow = [[PLLInputCarPlateWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
        
        //converView
        shareInputCarPlateWindow.coverView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [shareInputCarPlateWindow.coverView setBackgroundColor:[UIColor blackColor]];
        shareInputCarPlateWindow.coverView.alpha = 0.8f;
        [shareInputCarPlateWindow addSubview:shareInputCarPlateWindow.coverView];
        
        //containtView
        shareInputCarPlateWindow.containtView = [[UIView alloc] init];
        [shareInputCarPlateWindow addSubview:shareInputCarPlateWindow.containtView];
        
        //resultAreaView
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat cellWidth = ([[UIScreen mainScreen] bounds].size.width-6)/7;
        [layout setItemSize:CGSizeMake(cellWidth, cellWidth)];
        [layout setMinimumInteritemSpacing:1.0f];
        [layout setMinimumLineSpacing:1.0f];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];

        shareInputCarPlateWindow.resultAreaView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [shareInputCarPlateWindow.containtView addSubview:shareInputCarPlateWindow.resultAreaView];
        [shareInputCarPlateWindow.resultAreaView registerNib:[UINib nibWithNibName:@"PLLResultAreaCellCollectionViewCell"  bundle:nil] forCellWithReuseIdentifier:@"PLLResultAreaCellCollectionViewCell" ];


        //keyBoardAreaView
        UICollectionViewFlowLayout* layoutKeyboard = [[UICollectionViewFlowLayout alloc] init];
        CGFloat keyboardCellWidth = ([[UIScreen mainScreen] bounds].size.width-8)/9;
        [layoutKeyboard setItemSize:CGSizeMake(keyboardCellWidth, keyboardCellWidth)];
        [layoutKeyboard setMinimumInteritemSpacing:1];
        [layoutKeyboard setMinimumLineSpacing:1.0f];
        [layoutKeyboard setScrollDirection:UICollectionViewScrollDirectionVertical];
        shareInputCarPlateWindow.keyboardAreaView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layoutKeyboard];
        [shareInputCarPlateWindow.containtView addSubview:shareInputCarPlateWindow.keyboardAreaView];
        [shareInputCarPlateWindow.keyboardAreaView registerNib:[UINib nibWithNibName:@"PLLKeyBoardAreaCollectionViewCell"  bundle:nil] forCellWithReuseIdentifier:@"PLLKeyBoardAreaCollectionViewCell" ];
        
        [shareInputCarPlateWindow configGesture];
        [shareInputCarPlateWindow configHandler];
        [shareInputCarPlateWindow configConstraints];
        [shareInputCarPlateWindow configKVO];
        [shareInputCarPlateWindow configDefault];


    });
    return shareInputCarPlateWindow;
}

- (void)configConstraints{
    
    [self.containtView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.coverView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSDictionary *views = NSDictionaryOfVariableBindings(_containtView,_coverView);
    CGFloat containViewHeight,resultAreaHeight,keyboardAreaHeight;
    resultAreaHeight = ([[UIScreen mainScreen] bounds].size.width-6)/7;//每行7个 列间距1 行间距1
    keyboardAreaHeight = ([[UIScreen mainScreen] bounds].size.width-8)/9*5+4;//每行9个 列间距1 行间距1
    containViewHeight = keyboardAreaHeight + resultAreaHeight + 10;
    
    NSDictionary * metrics = @{@"resultAreaHeight":@(resultAreaHeight),@"keyboardAreaHeight":@(keyboardAreaHeight)};

    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_containtView]-0-|" options:NSLayoutFormatAlignAllTop metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_containtView]-0-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
    self.containViewHeightConstatint = [NSLayoutConstraint constraintWithItem:self.containtView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:containViewHeight];
    [self.containtView addConstraint:self.containViewHeightConstatint];
    


    [self.resultAreaView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.keyboardAreaView setTranslatesAutoresizingMaskIntoConstraints:NO];
    views = NSDictionaryOfVariableBindings(_resultAreaView,_keyboardAreaView);
    [self.containtView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_resultAreaView(==resultAreaHeight)]" options:NSLayoutFormatAlignAllTop metrics:metrics views:views]];
    [self.containtView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_resultAreaView]-0-|" options:NSLayoutFormatAlignAllTop metrics:metrics views:views]];
    
    [self.containtView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_keyboardAreaView(==keyboardAreaHeight)]-0-|" options:NSLayoutFormatAlignAllTop metrics:metrics views:views]];
    [self.containtView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_keyboardAreaView]-0-|" options:NSLayoutFormatAlignAllTop metrics:metrics views:views]];


}

- (void)configGesture{
    [self.coverView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
}

- (void)configHandler{

    self.inputResultAreaViewHandler = [PLLInputResultAreaViewHandler initDataHandleWithBlk:^(NSString  *str,PLLResultAreaCellCollectionViewCell *cell ) {
        if([str isEqualToString:@"null"]){
            cell.label.text = @" ";
        }else{
            cell.label.text = str;
        }
        

    } indentifiyStr:@"PLLResultAreaCellCollectionViewCell" dataArray:self.arrayPlate];
    self.inputResultAreaViewHandler.delegate = self;
    self.resultAreaView.delegate = self.inputResultAreaViewHandler;
    self.resultAreaView.dataSource = self.inputResultAreaViewHandler;

    
    
    self.inputKeyboardAreaViewHandler = [PLLInputKeyboardAreaViewHandler initDataHandleWithBlk:^(NSString *str, PLLKeyBoardAreaCollectionViewCell* cell) {
        if([str isEqualToString:@"null"]){
            cell.label.text = @" ";
        }else{
            cell.label.text = str;
        }
        
    } indentifiyStr:@"PLLKeyBoardAreaCollectionViewCell" keyboardTypeTag:PLLInputSelectKeyboardTypeProvince];
    self.inputKeyboardAreaViewHandler.delegate = self;
    self.keyboardAreaView.delegate = self.inputKeyboardAreaViewHandler;
    self.keyboardAreaView.dataSource = self.inputKeyboardAreaViewHandler;
    

}

-(void)configKVO{
    [self addObserver:self forKeyPath:@"arrayPlate" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)configDefault{
    //self.arrayPlate
    self.arrayPlate = @[@"null",@"null",@"null",@"null",@"null",@"null",@"null"];
    self.indexAddFlag = NO;
    
    [self.containtView setBackgroundColor:[PLLInputCarPlateConfig containerViewBackgroundColor]];
    [self.resultAreaView setBackgroundColor:[PLLInputCarPlateConfig resultViewBackgroundColor]];
    [self.keyboardAreaView setBackgroundColor:[PLLInputCarPlateConfig keyboardViewBackgroundColor]];

}

-(NSUInteger)calculateSelestIndex{
    
    __block NSUInteger result = 0;
    if([[self.resultAreaView indexPathsForSelectedItems] count]==0){
        //没有选中的 默认放到0 位置除非有null
        [self.arrayPlate enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            if([obj isEqualToString:@"null"]){
                result = idx;
                *stop = YES;
            }
        }];

    }else{
        //有选中的然后又改变了 且indexAddflag标记为ture 则下一移一位
        if(self.indexAddFlag){
            result = [self selectIndexInCollectionView:self.resultAreaView]+1;
            if(result>=7){
                [self.arrayPlate enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    if([obj isEqualToString:@"null"]){
                        result = idx;
                        *stop = YES;
                    }
                }];
                if(result>=7){
                    [self hide];
                    result = 6;
                }
                
            }
            self.indexAddFlag = NO;
        }
        
    }

    return result;
}


#pragma mark - changeKeyBoardWithIndex
-(void)changeKeyBoardWithIndex:(NSUInteger) index{

    if(index!=[self selectIndexInCollectionView:self.resultAreaView]){
        int tag = 0;
        if(index == 0){
            tag = PLLInputSelectKeyboardTypeProvince;
        }else if(index == 1){
            tag = PLLInputSelectKeyboardTypeCity;
        }else if(index ==6){
            tag = PLLInputSelectKeyboardTypeLastPlate;
        }else{
            tag = PLLInputSelectKeyboardTypeNormalPlate;
        }
        
        [self.inputKeyboardAreaViewHandler changeKeyBoardTypeToType:tag withCollectionView:_keyboardAreaView];
    }
}

#pragma mark - kvo
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([@"arrayPlate" isEqualToString:keyPath]){
        NSLog(@"change[NSKeyValueChangeNewKey]:%@",change[NSKeyValueChangeNewKey]);
        [self.inputResultAreaViewHandler setDataArray:change[NSKeyValueChangeNewKey]];
        NSUInteger index = [self calculateSelestIndex];
        [self changeKeyBoardWithIndex:index];
        [self.resultAreaView reloadData];
        [self.inputResultAreaViewHandler selectIndex:index collectionView:self.resultAreaView];

    }
}

#pragma mark - PLLInputResultAreaViewHandlerDelegate
-(void)resultSelectIndex:(NSUInteger)index{
    [self changeKeyBoardWithIndex:index];
}

#pragma mark - PLLInputKeyboardAreaViewHandlerDelegate
-(void)keyboardClickStr:(NSString *)str{
    //修改plate
    self.indexAddFlag = YES;
    [self changeArrayPlateWithStr:str index:[self selectIndexInCollectionView:self.resultAreaView]];
}

-(void)changeArrayPlateWithStr:(NSString *)str index:(NSUInteger)index{
    NSMutableArray* mArray = [self.arrayPlate mutableCopy];
    [mArray replaceObjectAtIndex:index withObject:str];
    self.arrayPlate = mArray;
}

#pragma mark - public
- (void)setPlateStr:(NSString*)str{
    NSMutableArray* mArray = [@[] mutableCopy];
    if([str length]>7)
    {
        str = [str substringWithRange:NSMakeRange(0, 7)];
    }
    if(str){
        for(int i=0;i<[str length];i++){
            [mArray addObject:[str substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    while([mArray count]<7){
        [mArray addObject:@"null"];
    }
    self.arrayPlate = mArray;
}

- (PLLInputCarPlateWindow* )showWithPlateStr:(NSString*) str{
    [self setPlateStr:str];
    [self makeKeyWindow];
    self.hidden = NO;
    self.alpha = 1.0f;
    return self;

}

- (void)hide{
    [self.resultAreaView deselectItemAtIndexPath:[[self.resultAreaView indexPathsForSelectedItems] lastObject] animated:NO];
    [self.keyboardAreaView deselectItemAtIndexPath:[[self.keyboardAreaView indexPathsForSelectedItems] lastObject] animated:NO];
    
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self resignKeyWindow];
    }];
    [self.resultDelegate resultPlateStr:[self stringFromResultArray]];

    
}

-(NSUInteger)selectIndexInCollectionView:(UICollectionView*) collectionview{
    return ((NSIndexPath *)[[collectionview indexPathsForSelectedItems] lastObject]).row;
}

-(NSString*) stringFromResultArray{
    NSMutableString* mStr = [@"" mutableCopy];
    for(NSString* str in self.arrayPlate){
        [mStr appendString:str];
    }
    return [mStr copy];
}



@end
