//
//  PLLKeyBoardAreaCollectionViewCell.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "PLLKeyBoardAreaCollectionViewCell.h"
#import "PLLInputCarPlateConfig.h"

@implementation PLLKeyBoardAreaCollectionViewCell
- (void)awakeFromNib {
    [self.label setTextColor:[PLLInputCarPlateConfig keyboardViewCellLabelNormalColor]];
    [self.label setHighlightedTextColor:[PLLInputCarPlateConfig keyboardViewCellLabelHighlightColor]];

    [self.backgroundImageView setImage:[PLLInputCarPlateConfig keyboardViewCellBackGroundImageViewNormalImage]];
//    [self.backgroundImageView setHighlightedImage:[PLLInputCarPlateConfig keyboardViewCellBackGroundImageViewHighlightImage]];

    //test
    [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];
    
    [self.layer setCornerRadius:5.0f];
    [self.layer setShadowColor:[[UIColor grayColor] CGColor]];
    [self.layer setShadowRadius:1.0f];

}

- (void)removeFromSuperview{
    [self removeObserver:self forKeyPath:@"highlighted"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([@"highlighted" isEqualToString:keyPath]){
        NSLog(@"%@",change[NSKeyValueChangeNewKey]);
        BOOL highlighted = [change[NSKeyValueChangeNewKey] boolValue];
        if(highlighted){
            [self.backgroundImageView setImage:[PLLInputCarPlateConfig keyboardViewCellBackGroundImageViewHighlightImage]];
        }else{
            [self.backgroundImageView setImage:[PLLInputCarPlateConfig keyboardViewCellBackGroundImageViewNormalImage]];
        }
    }
}




@end
