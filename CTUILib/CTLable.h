//
//  CTLable.h
//  CTLableDemo
//
//  Created by Admin on 16/7/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NSTextVerticalAlignment)
{
    NSTextVerticalAlignmentTop = 0,
    NSTextVerticalAlignmentMiddle,  // default
    NSTextVerticalAlignmentBotom,
} ;

@interface CTLable : UILabel
// 垂直对齐方式
@property (nonatomic, assign)NSTextVerticalAlignment verticalAlignment;

@end
