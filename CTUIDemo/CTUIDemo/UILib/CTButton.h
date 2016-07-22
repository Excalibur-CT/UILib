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
    CTButtonPlainHorizontalType = 0,       // 横向排列(图片在左,文字在右)
    CTButtonPlainHorizontalInvertType = 1, // 横向排列(文字在左,图片在右)
    CTButtonPlainVerticalType = 2,         // 纵向排列(文字在上,图片在下)
    CTButtonPlainVerticalInvertType = 3,   // 纵向排列(图片在上,文字在下)
    CTButtonPlainCenterType = 4,           // 居中排列
    CTButtonPlainOriginalType = 5,         // 原始排列方式 (采用此种方式, 本类中的space,horizontalOffset, verticalOffset属性将失效)
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

/**
 *  初始化方法
 *
 *  @param plainType
 *
 */
+ (instancetype)buttonWithPlainType:(CTButtonPlainType)plainType;
/**
 *  设置正常状态下的文字和Image
 *
 *  @param title       文字
 *  @param normalImage normal 状态下的image
 */
- (void)setNormalTitle:(NSString *)title
           normalImage:(UIImage *)normalImage;

/**
 *  设置正常状态下的文字和Image 和 选中状态下的Image
 *
 *  @param title         文字
 *  @param normalImage   正常状态下Image
 *  @param selectedImage 选中状态下的Image
 */
- (void)setNormalTitle:(NSString *)title
           normalImage:(UIImage *)normalImage
         selectedImage:(UIImage *)selectedImage;
#pragma mark - title Color -

/**
 *  设置不同状态下文本颜色
 *
 *  @param normalColor      正常状态
 *  @param disableColor     失效状态
 */
- (void)setTitleColorForNormal:(UIColor *)normalColor
                      disabled:(UIColor *)disableColor;
/**
 *  设置不同状态下文本颜色
 *
 *  @param normalColor      正常状态
 *  @param highlightedColor 高亮状态
 *  @param selectedColor    选中状态
 *  @param disableColor     失效状态
 */
- (void)setTitleColorForNormal:(UIColor *)normalColor
                   highlighted:(UIColor *)highlightedColor
                      selected:(UIColor *)selectedColor
                      disabled:(UIColor *)disableColor;

#pragma mark - image -

/**
 *  设置不同状态下的Image
 *
 *  @param normalImage   正常状态
 *  @param selectedImage 选中状态

 */
- (void)setImageForNormal:(UIImage *)normalImage
                 selected:(UIImage *)selectedImage;
/**
 *  设置不同状态下的Image
 *
 *  @param normalImage      正常状态
 *  @param highlightedImage 高亮状态
 *  @param selectedImage    选中状态
 *  @param disableImage     失效状态
 */
- (void)setImageForNormal:(UIImage *)normalImage
              highlighted:(UIImage *)highlightedImage
                 selected:(UIImage *)selectedImage
                 disabled:(UIImage *)disableImage;


#pragma mark - background image -
/**
 *  设置不同状态下的BackgroundImage
 *
 *  @param normalImage  正常状态
 *  @param disableImage 失效状态
 */
- (void)setBackgroundImageForNormal:(UIImage *)normalImage
                           disabled:(UIImage *)disableImage;
/**
 *  设置不同状态下的BackgroundImage
 *
 *  @param normalImage      正常状态
 *  @param highlightedImage 高亮状态
 *  @param disableImage     失效状态
 */
- (void)setBackgroundImageForNormal:(UIImage *)normalImage
                        highlighted:(UIImage *)highlightedImage
                           disabled:(UIImage *)disableImage;
/**
 *  设置不同状态下的BackgroundImage
 *
 *  @param normalImage      正常状态
 *  @param highlightedImage 高亮状态
 *  @param selectedImage    选中状态
 *  @param disableImage     失效状态
 */
- (void)setBackgroundImageForNormal:(UIImage *)normalImage
                        highlighted:(UIImage *)highlightedImage
                           selected:(UIImage *)selectedImage
                           disabled:(UIImage *)disableImage;


#pragma mark - border -

/**
 *  设置边框
 *
 *  @param borderColor  边框颜色
 *  @param borderWidth  边框宽度
 *  @param cornerRadius 圆角弧度
 */
- (void)setBorderColor:(UIColor *)borderColor
           borderWidth:(CGFloat)borderWidth
          cornerRadius:(CGFloat)cornerRadius;


@end
