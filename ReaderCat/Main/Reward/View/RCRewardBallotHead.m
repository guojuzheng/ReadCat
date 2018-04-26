//
//  RCRewardBallotHead.m
//  ReaderCat
//
//  Created by guojz on 2018/4/24.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardBallotHead.h"
@interface RCRewardBallotHead()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
@implementation RCRewardBallotHead
- (void)loadSubViews {
    self.backgroundColor =WhiteColor;
    self.selectedIndex = nil;
    self.lineA = [UIView new];
    self.lineB = [UIView new];
    self.lineC = [UIView new];
    self.lineA.backgroundColor =
    self.lineB.backgroundColor =
    self.lineC.backgroundColor = DEFAULT_BG_COLOR;
    UIView *line = [UIView new];
    line.backgroundColor = DEFAULT_BG_COLOR;
    self.rewardInfoView = [RCRewardInfoView new];
    [self sd_addSubviews:@[line,self.rewardInfoView,self.lineA,self.lineB,self.lineC]];
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
    self.lineA.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.rewardInfoView, 0)
    .heightIs(1);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    [self sd_addSubviews:@[self.collectionView]];
    self.collectionView.backgroundColor = WhiteColor;
    self.collectionView.sd_layout
    .leftSpaceToView(self, 0)
    .topSpaceToView(self.lineA, 0)
    .rightEqualToView(self)
    .heightIs(50);
    self.lineB.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.collectionView, 0)
    .heightIs(1);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    //注册Cell
    [self.collectionView registerClass:[RCCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    [self layoutSubviews];
    
    self.numberLabel = Label.fnt(12).color(@"#999999").str(@"今日剩余票数:0张");
    self.tipView = Label.fnt(12).color(@"#999999");
    NSMutableAttributedString *AttributedStr=[[NSMutableAttributedString alloc]initWithString:@"注:每投票一张推荐票可获得10成长值"];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0]
                         range:NSMakeRange(0,2)];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                         value:[UIColor redColor]
                         range:NSMakeRange(0,2)];
    self.tipView.attributedText = AttributedStr;
    [self sd_addSubviews:@[self.numberLabel,self.tipView]];
    self.numberLabel.sd_layout
    .leftSpaceToView(self, 10)
    .topSpaceToView(self.collectionView, 10)
    .heightIs(12)
    .widthRatioToView(self, 0.6);
    self.tipView.sd_layout
    .leftEqualToView(self.numberLabel)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self.numberLabel, 5)
    .heightIs(12);
    self.lineC.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(1);
}

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
    RCCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.cellLabel.text = @"1张";
    if (indexPath && self.selectedIndex == indexPath) {
        cell.cellLabel.backgroundColor = ThemeColor;
        cell.cellLabel.textColor = BlackColor;
        cell.cellLabel.layer.borderColor = BlackColor.CGColor;
    } else {
        cell.cellLabel.backgroundColor = WhiteColor;
        cell.cellLabel.textColor = Color(@"#999999");
        cell.cellLabel.layer.borderColor = Color(@"#999999").CGColor;
    }
    return cell;
}

#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    return  CGSizeMake(DeviceSize.width /3,(DeviceSize.width / 3));
    return CGSizeMake(43, 23);
}

#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(13, 15, 13, 0);//（上、左、下、右）
}

#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndex = indexPath;
    [self.collectionView reloadData];
}
@end


@implementation RCCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cellLabel = [UILabel new];
        self.cellLabel.textAlignment = NSTextAlignmentCenter;
        self.cellLabel.fnt(11).color(@"#bfbfbf");
        self.cellLabel.text = @"";
        self.cellLabel.layer.cornerRadius = 2;
        self.cellLabel.layer.borderWidth = 1;
        self.cellLabel.layer.borderColor = Color(@"#999999").CGColor;
        self.cellLabel.layer.masksToBounds = YES;
        self.cellLabel.backgroundColor = WhiteColor;
        [self sd_addSubviews:@[self.cellLabel]];
        self.cellLabel.sd_layout
        .leftEqualToView(self)
        .rightEqualToView(self)
        .topEqualToView(self)
        .bottomEqualToView(self);
    }
    return self;
}
@end
