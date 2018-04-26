//
//  QMUIFillButton+category.h
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

@interface QMUIFillButton (category)
+ (QMUIFillButton *)creatQMUIFillButtonWithTitle:(NSString *)title fillColor:(UIColor *)fillColor titleTextColor:(UIColor *)titleTextColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth     cornerRadius:(CGFloat)cornerRadius font:(CGFloat)font;
+ (QMUIButton *)creatQMUIBtnWithImage:(NSString *)imageName title:(NSString *)title  titleImageSpace:(float)space imagePosition:(QMUIButtonImagePosition)imagePosition font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor;
@end
