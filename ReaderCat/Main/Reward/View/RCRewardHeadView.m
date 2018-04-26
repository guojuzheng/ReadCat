//
//  RCRewardHeadView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/30.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardHeadView.h"
@implementation RCRewardHeadView
- (void)loadSubViews {
    self.backgroundColor = DEFAULT_BG_COLOR;
    UIView *line = [UIView new];
    line.backgroundColor = DEFAULT_BG_COLOR;
    self.rewardInfoView = [RCRewardInfoView new];
    self.rewardCountView = [RCRewardCountView new];
    [self.rewardCountView.rightButton setTitle:@"打赏作者" forState:UIControlStateNormal];
    [self sd_addSubviews:@[line,self.rewardInfoView,self.rewardCountView]];
    line.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .heightIs(5);
    self.rewardInfoView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(line, 0)
    .heightIs(108);
    
    self.rewardCountView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.rewardInfoView, 1)
    .heightIs(51);
}
@end
