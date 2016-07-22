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
    return [[self class] buttonWithPlainType:CTButtonPlainHorizontalType];
}

+ (instancetype)buttonWithPlainType:(CTButtonPlainType)plainType
{
    CTButton * button = [super buttonWithType:UIButtonTypeCustom];
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
    
    
    CGFloat half_X = (orgSize.width - (titleSize.width + imageSize.width))/2.0;
    CGFloat half_Y = (orgSize.height - (titleSize.height + imageSize.height))/2.0;

    CGFloat max_Hori_space = fminf(half_X * 2, self.space);
    CGFloat max_Vert_space = fminf(half_Y * 2, self.space);

    
    // 缺图片或文字
    if (CGSizeEqualToSize(imageSize, CGSizeZero) || CGSizeEqualToSize(titleSize, CGSizeZero))
    {
        return;
    }
    
    if (_plainType == CTButtonPlainHorizontalType)
    {

        CGFloat res_Img_X = half_X - max_Hori_space/2.0f + self.horizontalOffset;
        CGFloat res_Img_Y = CGRectGetMinY(self.imageView.frame) + self.verticalOffset;
        self.imageView.frame = CGRectMake(res_Img_X, res_Img_Y, imageSize.width, imageSize.height);
        
        
        CGFloat res_Tit_X = CGRectGetMaxX(self.imageView.frame) + max_Hori_space;
        CGFloat res_Tit_Y = CGRectGetMinY(self.titleLabel.frame) + self.verticalOffset;
        self.titleLabel.frame = CGRectMake(res_Tit_X, res_Tit_Y, titleSize.width, titleSize.height);
    }
     else if (_plainType == CTButtonPlainHorizontalInvertType)
    {
        CGFloat res_Tit_X = half_X - max_Hori_space/2.0f + self.horizontalOffset;
        CGFloat res_Tit_Y = CGRectGetMinY(self.titleLabel.frame) + self.verticalOffset;
        self.titleLabel.frame = CGRectMake(res_Tit_X, res_Tit_Y, titleSize.width, titleSize.height);
        
        
        CGFloat res_Img_X = CGRectGetMaxX(self.titleLabel.frame) + max_Hori_space;
        CGFloat res_Img_Y = CGRectGetMinY(self.imageView.frame) + self.verticalOffset;
        self.imageView.frame = CGRectMake(res_Img_X, res_Img_Y, imageSize.width, imageSize.height);
    }
    else if (_plainType == CTButtonPlainVerticalType)
    {
        CGFloat res_Tit_X = (orgSize.width - titleSize.width)/2.0f + self.horizontalOffset;
        CGFloat res_Tit_Y = half_Y - max_Vert_space / 2.0f + self.verticalOffset;
        self.titleLabel.frame = CGRectMake(res_Tit_X, res_Tit_Y, titleSize.width, titleSize.height);
        
        CGFloat res_Img_X = (orgSize.width - imageSize.width)/2.0f + self.horizontalOffset;
        CGFloat res_Img_Y = CGRectGetMaxY(self.titleLabel.frame) + max_Vert_space;
        self.imageView.frame = CGRectMake(res_Img_X, res_Img_Y, imageSize.width, imageSize.height);
    }
    else if (_plainType == CTButtonPlainVerticalInvertType)
    {
        CGFloat res_Img_X = (orgSize.width - imageSize.width)/2.0f + self.horizontalOffset;
        CGFloat res_Img_Y = half_Y - max_Vert_space / 2.0f + self.verticalOffset;
        self.imageView.frame = CGRectMake(res_Img_X, res_Img_Y, imageSize.width, imageSize.height);
        
        CGFloat res_Tit_X = (orgSize.width - titleSize.width)/2.0f + self.horizontalOffset;
        CGFloat res_Tit_Y = CGRectGetMaxY(self.imageView.frame) + max_Vert_space;
        self.titleLabel.frame = CGRectMake(res_Tit_X, res_Tit_Y, titleSize.width, titleSize.height);
    }
    else if (_plainType == CTButtonPlainCenterType)
    {
        CGPoint center = CGPointMake(orgSize.width/2.0f + self.horizontalOffset, orgSize.height/2.0f+ self.verticalOffset);
        self.imageView.center = center;
        self.titleLabel.center = center;
    }
}


#pragma  mark - Custom method -

- (void)setNormalTitle:(NSString *)title
           normalImage:(UIImage *)image
{
    [self setNormalTitle:title normalImage:image selectedImage:nil];
}

- (void)setNormalTitle:(NSString *)title
           normalImage:(UIImage *)normalImage
         selectedImage:(UIImage *)selectedImage
{
    if (title.length != 0)
    {
        [self setTitle:title forState:UIControlStateNormal];
    }
    if (normalImage != nil)
    {
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    if (selectedImage != nil)
    {
        [self setImage:selectedImage forState:UIControlStateSelected];
    }
}

- (void)setTitleColorForNormal:(UIColor *)normalColor
                      disabled:(UIColor *)disableColor
{
    [self setTitleColorForNormal:normalColor
                     highlighted:nil
                        selected:nil
                        disabled:disableColor];
}

- (void)setTitleColorForNormal:(UIColor *)normalColor
                   highlighted:(UIColor *)highlightedColor
                      selected:(UIColor *)selectedColor
                      disabled:(UIColor *)disableColor
{
    if (normalColor != nil)
    {
        [self setTitleColor:normalColor forState:UIControlStateNormal];
    }
    if (highlightedColor != nil)
    {
        [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    }
    if (selectedColor != nil)
    {
        [self setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    if (disableColor != nil)
    {
        [self setTitleColor:disableColor forState:UIControlStateDisabled];
    }
}

- (void)setImageForNormal:(UIImage *)normalImage
                 selected:(UIImage *)selectedImage
{
    [self setImageForNormal:normalImage
                highlighted:nil
                   selected:selectedImage
                   disabled:nil];
}

- (void)setImageForNormal:(UIImage *)normalImage
              highlighted:(UIImage *)highlightedImage
                 selected:(UIImage *)selectedImage
                 disabled:(UIImage *)disableImage
{
    if (normalImage != nil)
    {
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    if (highlightedImage != nil)
    {
        [self setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    if (selectedImage != nil)
    {
        [self setImage:selectedImage forState:UIControlStateHighlighted];
    }
    if (disableImage != nil)
    {
        [self setImage:disableImage forState:UIControlStateDisabled];
    }
}

- (void)setBackgroundImageForNormal:(UIImage *)normalImage
                           disabled:(UIImage *)disableImage
{
    [self setBackgroundImageForNormal:normalImage
                          highlighted:nil
                             selected:nil
                             disabled:disableImage];
}

- (void)setBackgroundImageForNormal:(UIImage *)normalImage
                        highlighted:(UIImage *)highlightedImage
                           disabled:(UIImage *)disableImage
{
    [self setBackgroundImageForNormal:normalImage
                          highlighted:highlightedImage
                             selected:nil
                             disabled:disableImage];
}

- (void)setBackgroundImageForNormal:(UIImage *)normalImage
                        highlighted:(UIImage *)highlightedImage
                           selected:(UIImage *)selectedImage
                           disabled:(UIImage *)disableImage
{
    if (normalImage != nil)
    {
        [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    }
    if (highlightedImage != nil)
    {
        [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    }
    if (selectedImage != nil)
    {
        [self setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    }
    if (disableImage != nil)
    {
        [self setBackgroundImage:disableImage forState:UIControlStateDisabled];
    }
}


- (void)setBorderColor:(UIColor *)borderColor
           borderWidth:(CGFloat)borderWidth
          cornerRadius:(CGFloat)cornerRadius
{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = cornerRadius;
}


@end
