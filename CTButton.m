//
//  CTButton.m
//  MicroAuction
//
//  Created by Admin on 16/7/6.
//  Copyright © 2016年 Excalibur.Cheng. All rights reserved.
//

#import "CTButton.h"

@implementation CTButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType
{
    return [[self class] buttonWithType:buttonType plainType:CTButtonPlainHorizontalType];
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType plainType:(CTButtonPlainType)plainType
{
    CTButton * button = [super buttonWithType:buttonType];
    button.exclusiveTouch = YES;
    button.plainType = plainType;
    return button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (_plainType == CTButtonPlainOriginalType)
    {
        return;
    }
    
    CGSize orgSize = self.frame.size;
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // 缺图片或文字
    if (CGSizeEqualToSize(imageSize, CGSizeZero) || CGSizeEqualToSize(titleSize, CGSizeZero))
    {
        return;
    }
    
    if (_plainType == CTButtonPlainHorizontalType)
    {
        CGFloat res_Img_X = CGRectGetMinX(self.imageView.frame) - self.space/2.0f + self.horizontalOffset;
        CGFloat res_Img_Y = CGRectGetMinY(self.imageView.frame) + self.verticalOffset;
        
        res_Img_X = fmaxf(res_Img_X, 0.0f);
        self.imageView.frame = CGRectMake(res_Img_X, res_Img_Y, imageSize.width, imageSize.height);
        
        
        CGFloat res_Tit_X = CGRectGetMinX(self.titleLabel.frame) + self.space/2.0f +self.horizontalOffset;
        CGFloat res_Tit_Y = CGRectGetMinY(self.titleLabel.frame) + self.verticalOffset;
        if ((res_Tit_X + titleSize.width) > orgSize.width)
        {
            res_Tit_X = orgSize.width - titleSize.width;
        }
        self.titleLabel.frame = CGRectMake(res_Tit_X, res_Tit_Y, titleSize.width, titleSize.height);
    }
    else if (_plainType == CTButtonPlainVerticalType)
    {
        CGFloat res_Img_X = (orgSize.width - imageSize.width)/2.0f + self.horizontalOffset;
        CGFloat res_Img_Y = (orgSize.height - imageSize.height - titleSize.height - self.space)/2.0f + self.verticalOffset;
        self.imageView.frame = CGRectMake(res_Img_X, res_Img_Y, imageSize.width, imageSize.height);
        
        CGFloat res_Tit_X = (orgSize.width - titleSize.width)/2.0f + self.horizontalOffset;
        CGFloat res_Tit_Y = CGRectGetMaxY(self.imageView.frame) + self.space + self.verticalOffset;
        self.titleLabel.frame = CGRectMake(res_Tit_X, res_Tit_Y, titleSize.width, titleSize.height);
    }
    else if (_plainType == CTButtonPlainCenterType)
    {
        CGPoint center = CGPointMake(orgSize.width/2.0f + self.horizontalOffset, orgSize.height/2.0f+ self.verticalOffset);
        self.imageView.center = center;
        self.titleLabel.center = center;
    }
}

@end
