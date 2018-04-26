//
//  RCTopView.m
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCTopView.h"

@implementation RCTopView
- (void)loadSubViews {
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [searchBtn setCornerBackgroundColor:[UIColor whiteColor] withRadius:2.0 forState:UIControlStateNormal];
//    [searchBtn setCornerBackgroundColor:RGBColor(200, 200, 200) withRadius:5.0 forState:UIControlStateHighlighted];
    searchBtn.backgroundColor = WhiteColor;
    [searchBtn setTitle:@"请输入书名" forState: UIControlStateNormal];
    [searchBtn setTitleColor:Color(@"#999999") forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"common_search_icon"] forState:UIControlStateNormal];
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
//    searchBtn.frame = CGRectMake(btnWidth, kStatusBarHeight + 7, kUIScreenWidth - 2 * btnWidth, btnHight - 14);
    searchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    searchBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self sd_addSubviews:@[searchBtn]];
    searchBtn.sd_layout
    .leftSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self, StatusBarHeight +7)
    .heightIs(NavigationBarHeight-14);
    
}
- (void)setBarAlpha:(CGFloat)barAlpha
{
    _barAlpha = barAlpha;
    self.backgroundColor = RGB_A_COLOR(249, 201, 9, barAlpha);
}
@end
