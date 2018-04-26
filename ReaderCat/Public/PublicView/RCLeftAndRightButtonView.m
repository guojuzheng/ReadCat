//
//  RCLeftAndRightButtonView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/30.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCLeftAndRightButtonView.h"


@implementation RCLeftAndRightButtonView
- (void)loadSubViews {
    _leftButton = [self creatButtonWithTitle:@"取消" backgroundColor:WhiteColor titleColor:BlackColor fontSize:16];
    _rightButton = [self creatButtonWithTitle:@"确定" backgroundColor:ThemeColor titleColor:BlackColor fontSize:16];
    
    [self sd_addSubviews:@[_leftButton,_rightButton]];
    
    _leftButton.sd_layout
    .leftEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(SCREEN_WIDTH/2);
    
    _rightButton.sd_layout
    .rightEqualToView(self)
    .topEqualToView(_leftButton)
    .bottomEqualToView(_leftButton)
    .widthIs(SCREEN_WIDTH/2);
}
- (QMUIFillButton *)creatButtonWithTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor fontSize:(float)fontSize {
    QMUIFillButton *button = [[QMUIFillButton alloc] initWithFillColor:backgroundColor titleTextColor:titleColor];
    button.fnt(fontSize);
    button.cornerRadius = 0;
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}
@end

