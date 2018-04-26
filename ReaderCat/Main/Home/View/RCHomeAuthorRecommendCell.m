//
//  RCHomeAuthorRecommendCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/4.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCHomeAuthorRecommendCell.h"
#import "RCChargeHeadView.h"
@interface RCHomeAuthorRecommendCell()

@property (nonatomic, strong) RCChargeHeadView        *authorView;
@end
@implementation RCHomeAuthorRecommendCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}
- (void)configSubviews {
    self.authorView = [RCChargeHeadView new];
    [self sd_addSubviews:@[self.authorView]];
    self.authorView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self);
}
@end
