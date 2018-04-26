//
//  RCChartTypeView.h
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
typedef void (^ segmentBlock) (NSInteger selectedIndex);
@interface RCChartTypeView : BaseView
@property (nonatomic, strong)UISegmentedControl *segmentSelecter;
@property (nonatomic, copy)segmentBlock segmentBlock;
- (void)setSegmentTitle:(NSArray *)titleArray;
@end
