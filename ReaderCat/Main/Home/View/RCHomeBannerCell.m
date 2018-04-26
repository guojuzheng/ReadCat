//
//  RCHomeBannerCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/4.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCHomeBannerCell.h"
#import "SDCycleScrollView.h"
@interface RCHomeBannerCell()<SDCycleScrollViewDelegate>
@property (nonatomic, strong)SDCycleScrollView        *cycleBannerView;
@property (nonatomic, strong)UIImageView              *leftImage;
@property (nonatomic, strong)UILabel                  *tipLabel;
@end
@implementation RCHomeBannerCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}
- (void)configSubviews {
    self.backgroundColor = WhiteColor;
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
    .heightIs(185);
    self.leftImage = [UIImageView new];
    self.leftImage.backgroundColor = ThemeColor;
    [self sd_addSubviews:@[self.leftImage]];
    self.leftImage.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self.cycleBannerView, 8)
    .widthIs(19)
    .heightIs(15);
    self.tipLabel = Label.fnt(12).color(@"#999999").str(@"今日主推：【医务圣王】意外得到秘密传承，学渣变神医，行医济世");
    self.tipLabel.numberOfLines = 0;
    self.tipLabel.lineBreakMode = NSLineBreakByClipping;
    [self sd_addSubviews:@[self.tipLabel]];
    self.tipLabel.sd_layout
    .leftSpaceToView(self.leftImage, 9)
    .rightSpaceToView(self, 21)
    .topEqualToView(self.leftImage)
    .heightIs(32);
    for (int i = 0; i < 5; i++) {
        QMUIButton *button = [self creatQMUIBtnWithImage:@"charge" title:@"打榜" titleImageSpace:5 imagePosition:QMUIButtonImagePositionTop font:11 backgroundColor:WhiteColor titleColor:Color(@"#333333")];
        [self sd_addSubviews:@[button]];
        button.sd_layout
        .leftSpaceToView(self, i *SCREEN_WIDTH/5)
        .topSpaceToView(self.tipLabel, 1)
        .bottomSpaceToView(self, 0)
        .widthIs(SCREEN_WIDTH/5);
    }
    
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
- (QMUIButton *)creatQMUIBtnWithImage:(NSString *)imageName title:(NSString *)title  titleImageSpace:(float)space imagePosition:(QMUIButtonImagePosition)imagePosition font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor {
    QMUIButton  *button = [[QMUIButton alloc] init];
    [button setBackgroundColor:backgroundColor];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.imagePosition = imagePosition;
    button.spacingBetweenImageAndTitle = space;
    [button setImage:UIImageMake(imageName) forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = UIFontMake(fontSize);
    button.qmui_borderPosition = QMUIBorderViewPositionTop | QMUIBorderViewPositionBottom;
    return button;
}
@end
