//
//  RCPurchaseMoneyView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCPurchaseMoneyView.h"
@interface RCPurchaseMoneyView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSIndexPath        *selectedIndex;
@end
@implementation RCPurchaseMoneyView

- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.selectedIndex = [NSIndexPath indexPathForItem:-1 inSection:0];
    self.viewTitle =  Label.fnt(14).color(@"#000000").str(@"请选择充值金额");
    self.rightTitle = Label.fnt(10).color(@"#999999").str(@"1元=100阅读币");
    self.rightTitle.textAlignment = NSTextAlignmentRight;
    self.tipView = [UITextView new];
    self.tipView.textAlignment = NSTextAlignmentJustified;
    self.tipView.fnt(10).color(@"#999999").str(@"通知：若您点击微信支付报错或者没有反应，请点击微信扫码支付，然后再微信内长按二维码进行支付。如仍不能解决问题，请直接给我们微信服务号“阅读猫”留言解决，或添加我们客服QQ：848317996");
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    self.moneyCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    [self sd_addSubviews:@[self.moneyCollectionView]];
    self.moneyCollectionView.backgroundColor = WhiteColor;
    self.moneyCollectionView.delegate = self;
    self.moneyCollectionView.dataSource = self;
    self.moneyCollectionView.scrollEnabled = YES;
    [self.moneyCollectionView registerClass:[RCPurchaseMoneyCell class] forCellWithReuseIdentifier:@"cell"];
    [self sd_addSubviews:@[self.viewTitle,self.rightTitle,self.moneyCollectionView,self.tipView]];
    self.viewTitle.sd_layout
    .leftSpaceToView(self, 20)
    .topSpaceToView(self, 20)
    .heightIs(20)
    .widthRatioToView(self, 0.5);
    self.rightTitle.sd_layout
    .leftSpaceToView(self.viewTitle, 0)
    .rightSpaceToView(self, 20)
    .centerYEqualToView(self.viewTitle)
    .heightIs(20);
    self.moneyCollectionView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(self.viewTitle, 15)
    .heightIs(165);
    
    self.tipView.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(self.moneyCollectionView, 10)
    .heightIs(60);
    
}

#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}
#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    RCPurchaseMoneyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.topLabel.text = @"500元";
    if (indexPath.item == self.selectedIndex.item) {
        cell.backgroundColor = ThemeColor;
        cell.layer.borderColor = Color(BlackColor).CGColor;
    } else {
        cell.backgroundColor = WhiteColor;
        cell.layer.borderColor = Color(@"#999999").CGColor;
    }
    return cell;
}
#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-80)/2, 45);
}
#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 30, 0, 30);//（上、左、下、右）
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}
#pragma mark  定义每个UICollectionView的竖向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectedIndex.item == indexPath.item) {
        self.selectedIndex = [NSIndexPath indexPathForItem:-1 inSection:0];
    } else {
        self.selectedIndex = indexPath;
    }
    [self.moneyCollectionView reloadData];
}

@end


@implementation RCPurchaseMoneyCell
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
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = Color(@"#999999").CGColor;
    self.layer.borderWidth = 1;
    
    self.topLabel = Label.fnt(14).color(@"#000000").str(@"100元");
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel = Label.fnt(10).color(@"#999999").str(@"送38元");
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    
    [self sd_addSubviews:@[self.topLabel,self.bottomLabel]];
    self.topLabel.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self, 10)
    .heightIs(14);
    
    self.bottomLabel.sd_layout
    .topSpaceToView(self.topLabel, 4)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(10);
}
@end
