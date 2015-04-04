//
//  PLLResultAreaCellCollectionViewCell.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "PLLResultAreaCellCollectionViewCell.h"
#import "PLLInputCarPlateConfig.h"

@implementation PLLResultAreaCellCollectionViewCell

- (void)awakeFromNib {
    [self.label setTextColor:[PLLInputCarPlateConfig resultViewCellLabelNormalColor]];
    [self.label setHighlightedTextColor:[PLLInputCarPlateConfig resultViewCellLabelHighlightColor]];
    
    [self setBackgroundColor:[PLLInputCarPlateConfig resultViewCellColor]];

    [self setSelectedBackgroundView:[[UIView alloc] init]];
    [self.selectedBackgroundView setBackgroundColor:[PLLInputCarPlateConfig resultViewCellSelectedColor]];
}

@end
