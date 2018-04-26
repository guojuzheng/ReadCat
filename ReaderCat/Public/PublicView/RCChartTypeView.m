//
//  RCChartTypeView.m
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCChartTypeView.h"

@implementation RCChartTypeView

- (void)loadSubViews {
    self.segmentSelecter = [[UISegmentedControl alloc] init];
    self.segmentSelecter.backgroundColor = WhiteColor;
    self.segmentSelecter.tintColor = WhiteColor;
    [self.segmentSelecter setTitleTextAttributes:@{NSForegroundColorAttributeName: ThemeColor} forState:UIControlStateSelected];
    [self.segmentSelecter setTitleTextAttributes:@{NSForegroundColorAttributeName: Color(@"#000000")} forState:UIControlStateNormal];
    [self.segmentSelecter addTarget:self action:@selector(segmentSelected:) forControlEvents:UIControlEventValueChanged];
    [self sd_addSubviews:@[self.segmentSelecter]];
    self.segmentSelecter.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .heightIs(41);
}

- (void)setSegmentTitle:(NSArray *)titleArray {
    for (int i = 0; i < titleArray.count; i ++) {
        [self.segmentSelecter insertSegmentWithTitle:titleArray[i] atIndex:i animated:YES];
        if (i != titleArray.count-1) {
            UIView *lineView = [UIView new];
            lineView.backgroundColor = DEFAULT_BG_COLOR;
            [self bringSubviewToFront:lineView];
            [self sd_addSubviews:@[lineView]];
            lineView.sd_layout
            .centerYEqualToView(self)
            .leftSpaceToView(self, SCREEN_WIDTH/3*(i+1))
            .heightIs(31)
            .widthIs(1);
        }
    }
    self.segmentSelecter.selectedSegmentIndex = 0;
}

- (void)segmentSelected:(UISegmentedControl *)thisSegment {
    if (self.segmentBlock) {
        self.segmentBlock(thisSegment.selectedSegmentIndex);
    }
}
@end
