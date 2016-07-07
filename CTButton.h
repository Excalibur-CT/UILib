//
//  CTButton.h
//  MicroAuction
//
//  Created by Admin on 16/7/6.
//  Copyright © 2016年 Excalibur.Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CTButtonPlainType)
{
    CTButtonPlainHorizontalType = 0, // 横向排列
    CTButtonPlainVerticalType = 1,   // 纵向排列
    CTButtonPlainCenterType = 2,     // 居中排列
    CTButtonPlainOriginalType = 3,   // 原始排列方式 (采用此种方式, 本类中的属性将失效)
};

@interface CTButton : UIButton

/**
 *  图片和文字排列方式
 */
@property (nonatomic, assign)CTButtonPlainType plainType;

/**
 *  图片和文字的间隔
 */
@property (nonatomic, assign)CGFloat space;

/**
 *  横向偏移量 向左为负, 向右为正
 */
@property (nonatomic, assign)CGFloat horizontalOffset;

/**
 *  纵向偏移量 向上为负, 向下为正
 */
@property (nonatomic, assign)CGFloat verticalOffset;


+ (instancetype)buttonWithType:(UIButtonType)buttonType plainType:(CTButtonPlainType)plainType;



@end
