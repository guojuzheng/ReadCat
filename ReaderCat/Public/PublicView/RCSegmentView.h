//
//  RCSegmentView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
typedef void (^ segmentBlock) (NSInteger selectedIndex);
@interface RCSegmentView : BaseView
@property (nonatomic, strong)UISegmentedControl *segmentSelecter;
- (void)setSegmentTitle:(NSArray *)titleArray;
@property (nonatomic, copy)segmentBlock segmentBlock;
@end
