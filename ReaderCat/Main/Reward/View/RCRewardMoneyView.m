//
//  RCRewardMoneyView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/30.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardMoneyView.h"

@interface RCRewardMoneyView()<UICollectionViewDelegate,UICollectionViewDataSource>
@end
@implementation RCRewardMoneyView

- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
     self.viewTitle =  Label.fnt(14).color(@"#000000").str(@"请选择打赏金额");
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    self.moneyCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    [self sd_addSubviews:@[self.moneyCollectionView]];
    self.moneyCollectionView.backgroundColor = WhiteColor;
    self.moneyCollectionView.delegate = self;
    self.moneyCollectionView.dataSource = self;
    self.moneyCollectionView.scrollEnabled = YES;
    [self.moneyCollectionView registerClass:[RCRewardMoneyCell class] forCellWithReuseIdentifier:@"cell"];
    [self sd_addSubviews:@[self.viewTitle,self.moneyCollectionView]];
    self.viewTitle.sd_layout
    .leftSpaceToView(self, 20)
    .topSpaceToView(self, 20)
    .heightIs(20)
    .widthRatioToView(self, 0.5);
    self.moneyCollectionView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(self.viewTitle, 15)
    .heightIs(165);
    
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
    RCRewardMoneyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.cellTextLabel.text = @"100阅读币";
    //    cell.FQNumberLabel.text = self.numberArray[indexPath.row];
    //    if (self.selectedIndexPath == indexPath) {
    //        cell.FQNumberLabel.layer.borderColor = CircleBlueColor.CGColor;
    //        cell.FQNumberLabel.textColor = CircleBlueColor;
    //    } else {
    //        cell.FQNumberLabel.layer.borderColor = Color(@"#bfbfbf").CGColor;
    //        cell.FQNumberLabel.textColor = Color(@"#bfbfbf");
    //    }
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
@end
@implementation RCRewardMoneyCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}
- (void)configSubviews {
    self.backgroundColor = ThemeColor;
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = Color(@"#000000").CGColor;
    self.layer.borderWidth = 1;
    self.cellTextLabel = Label.fnt(14).color(@"#000000");
    self.cellTextLabel.textAlignment = NSTextAlignmentCenter;
    [self sd_addSubviews:@[self.cellTextLabel]];
    self.cellTextLabel.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .centerYEqualToView(self)
    .heightRatioToView(self, 1);
}
@end
