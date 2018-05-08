//
//  RCHomeBannerCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/4.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCHomeBannerCell.h"
#import "SDCycleScrollView.h"
#import "BaseViewController.h"
#import "RCRookInfoVC.h"
@interface RCHomeBannerCell()<SDCycleScrollViewDelegate>
{
    NSTimer *_timer;
}
@property (nonatomic, strong)SDCycleScrollView        *cycleBannerView;
@property (nonatomic, strong)UIImageView              *leftImage;
@property (nonatomic, strong)UILabel                  *tipLabel;

@end
@implementation RCHomeBannerCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
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
    self.tipLabel = Label.fnt(12).color(@"#999999");
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"今日主推: 医务圣王】意外得到秘密传承，学渣变神医，行医济世"];
    [attrStr addAttribute:NSForegroundColorAttributeName value:Color(@"#000000") range:NSMakeRange(0, 5)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:Color(@"#999999") range:NSMakeRange(5, attrStr.length-5)];
    self.tipLabel.attributedText = attrStr;
    self.tipLabel.numberOfLines = 0;
    self.tipLabel.lineBreakMode = NSLineBreakByClipping;
    [self sd_addSubviews:@[self.tipLabel]];
    self.tipLabel.sd_layout
    .leftSpaceToView(self.leftImage, 9)
    .rightSpaceToView(self, 21)
    .topEqualToView(self.leftImage)
    .heightIs(32);
    NSArray *titleArray = @[@"榜单",@"免费",@"充值",@"足迹"];
    for (int i = 0; i < titleArray.count; i++) {
        QMUIButton *button = [self creatQMUIBtnWithImage:@"charge" title:titleArray[i] titleImageSpace:5 imagePosition:QMUIButtonImagePositionTop font:11 backgroundColor:WhiteColor titleColor:Color(@"#333333")];
        [self sd_addSubviews:@[button]];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 +i;
        button.sd_layout
        .leftSpaceToView(self, i *SCREEN_WIDTH/titleArray.count)
        .topSpaceToView(self.tipLabel, 1)
        .bottomSpaceToView(self, 0)
        .widthIs(SCREEN_WIDTH/titleArray.count);
    }
    
}
- (void)setImageArray:(NSArray *)imageArray {
    _imageArray = imageArray;
    self.cycleBannerView.imageURLStringsGroup = imageArray;
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [[self getViewController].navigationController pushViewController:[RCRookInfoVC new] animated:YES];
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
//    button.qmui_borderPosition = QMUIBorderViewPositionTop | QMUIBorderViewPositionBottom;
    return button;
}

- (void)timerAction {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5f;
    animation.timingFunction=UIViewAnimationCurveEaseInOut;
    animation.type = @"cube";
    animation.subtype = kCATransitionFromTop;
    [self.tipLabel.layer addAnimation:animation forKey:nil];
}

- (void)buttonClick:(UIButton *)button {
    NSInteger tag = button.tag-100;
    NSString *schema;
    if (tag == 0) {
        schema = URL_SCHEMA_CHARTS;
    } else if (tag == 1) {
        schema = URL_SCHEMA_CHARGE;
    } else if (tag == 2) {
        schema = URL_SCHEMA_TOPPPED;
    } else if (tag == 3) {
        schema = URL_SCHEMA_HISTORY;
    }
    GMRouterBlock block = [[GMRouter shared] matchBlock:schema];
    BaseViewController *vc = block(nil);
    UIViewController *currentVc = [self currentViewController];
    [currentVc.navigationController pushViewController:vc animated:YES];
}

//确定是哪个viewcontroller
-(UIViewController *)currentViewController{
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = self.window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}

@end
