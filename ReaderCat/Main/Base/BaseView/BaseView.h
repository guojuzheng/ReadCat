//
//  BaseView.h
//  JupuCircle
//
//  Created by 樊星 on 2017/9/25.
//  Copyright © 2017年 樊星. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView
@property (nonatomic, strong) MyLinearLayout *lineLayout;
-(instancetype)initWithFrame:(CGRect)frame;
-(void)loadSubViews;
-(void)setMyFrameTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;
@end
