//
//  QMUIFillButton+category.m
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "QMUIFillButton+category.h"

@implementation QMUIFillButton (category)
+ (QMUIFillButton *)creatQMUIFillButtonWithTitle:(NSString *)title fillColor:(UIColor *)fillColor titleTextColor:(UIColor *)titleTextColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth     cornerRadius:(CGFloat)cornerRadius font:(CGFloat)font{
    QMUIFillButton *button = [[QMUIFillButton alloc] initWithFillColor:fillColor titleTextColor:titleTextColor];
    button.fnt(font);
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = borderWidth;
    button.cornerRadius = cornerRadius;
    return button;
}

+ (QMUIButton *)creatQMUIBtnWithImage:(NSString *)imageName title:(NSString *)title  titleImageSpace:(float)space imagePosition:(QMUIButtonImagePosition)imagePosition font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor {
    QMUIButton  *button = [[QMUIButton alloc] init];
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    [button setBackgroundColor:backgroundColor];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.imagePosition = imagePosition;
    button.spacingBetweenImageAndTitle = space;
    [button setImage:UIImageMake(imageName) forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = UIFontMake(fontSize);
//    button.qmui_borderPosition = QMUIBorderViewPositionTop | QMUIBorderViewPositionBottom;
    return button;
}
@end
