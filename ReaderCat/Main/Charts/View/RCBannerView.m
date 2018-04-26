//
//  RCBannerView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBannerView.h"
#import <SDCycleScrollView.h>
#import "RCBookBannerCell.h"
@interface RCBannerView()<SDCycleScrollViewDelegate>

@end
@implementation RCBannerView
- (void)loadSubViews {
    self.cycleBannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero
                                                              delegate:self
                                                      placeholderImage:[UIImage imageNamed:@"tabbar_icon0_normal"]];
    self.cycleBannerView.autoScrollTimeInterval = 3;
    self.cycleBannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleBannerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    self.cycleBannerView.titleLabelBackgroundColor = [UIColor clearColor];
    [self sd_addSubviews:@[self.cycleBannerView]];
    self.cycleBannerView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self);
}

- (void)setImageArray:(NSArray *)imageArray {
    _imageArray = imageArray;
    self.cycleBannerView.imageURLStringsGroup = imageArray;
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    
}

- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    if (view == self.cycleBannerView) {
        return [RCBookBannerCell class];
    }
    return nil;
}

- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    if (view == self.cycleBannerView) {
        RCBookBannerCell *bannerCell = (RCBookBannerCell *)cell;
        bannerCell.chartsTitle.text = @"112233";
        
    }
}
@end

