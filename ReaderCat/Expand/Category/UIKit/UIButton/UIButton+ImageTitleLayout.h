//
//  UIButton+ImageTitleLayout.h
//  JupuCircle
//
//  Created by guojz on 2018/1/13.
//  Copyright © 2018年 樊星. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIButtonEdgeInsetsStyle) {
    UIButtonEdgeInsetsStyleTop, // image在上，label在下
    UIButtonEdgeInsetsStyleLeft, // image在左，label在右
    UIButtonEdgeInsetsStyleBottom, // image在下，label在上
    UIButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (ImageTitleLayout)

- (void)layoutButtonWithEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space imageNamed:(NSString *)imageName title:(NSString *)title titleFont:(float)fontSize;
@end
