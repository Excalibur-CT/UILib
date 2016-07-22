//
//  CTLable.m
//  CTLableDemo
//
//  Created by Admin on 16/7/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "CTLable.h"

@implementation CTLable

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _verticalAlignment = NSTextVerticalAlignmentMiddle;
    }
    return self;
}

- (void)setVerticalAlignment:(NSTextVerticalAlignment)verticalAlignment
{
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (_verticalAlignment)
    {
        case NSTextVerticalAlignmentTop:
        {
            textRect.origin.y = bounds.origin.y;
            break;
        }
        case NSTextVerticalAlignmentBotom:
        {
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        }
        case NSTextVerticalAlignmentMiddle:
        default:
        {
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
            break;
        }
    }
    return textRect;
}

- (void)drawTextInRect:(CGRect)rect
{
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
