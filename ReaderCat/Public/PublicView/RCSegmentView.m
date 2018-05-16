//
//  RCSegmentView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCSegmentView.h"

@implementation RCSegmentView
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
    }
    self.segmentSelecter.selectedSegmentIndex = 0;
}

- (void)segmentSelected:(UISegmentedControl *)thisSegment {
    if (self.segmentBlock) {
        self.segmentBlock(thisSegment.selectedSegmentIndex);
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    self.segmentSelecter.selectedSegmentIndex = selectedIndex;
    if (self.segmentBlock) {
        self.segmentBlock(selectedIndex);
    }
}

@end
