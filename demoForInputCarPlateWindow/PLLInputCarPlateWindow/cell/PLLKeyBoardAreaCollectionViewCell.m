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
    [self.backgroundImageView setHighlightedImage:[PLLInputCarPlateConfig keyboardViewCellBackGroundImageViewHighlightImage]];
    
}

@end
