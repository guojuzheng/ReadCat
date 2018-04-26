//
//  RCBookStoreSearchView.m
//  ReaderCat
//
//  Created by guojz on 2018/4/16.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBookStoreSearchView.h"

@interface RCBookStoreSearchView()
@property (nonatomic, assign) BOOL        open;
@end

@implementation RCBookStoreSearchView

- (void)loadSubViews {
    self.backgroundColor = RGB_A_COLOR(0, 0, 0, 0.3);
    self.buttonTitleArray = [NSArray arrayWithObjects:@"男生",@"50万字",@"完结",@"爱情", nil];
    self.clumOneArray = [NSArray arrayWithObjects:@"全部",@"男生",@"女生", nil];
    self.clumTwoArray = [NSArray arrayWithObjects:@"全部",@"100万字",nil];
    self.clumThreeArray = [NSArray arrayWithObjects:@"全部",@"完结",@"更新中", nil];
    self.clumFourArray = [NSArray arrayWithObjects:@"全部",@"爱情",@"都市",@"玄幻",@"武侠", nil];
    for (int a = 0; a < 4 ; a++) {
        QMUIButton *button = [self creatQMUIBtnWithImage:@"Arrow" title:self.buttonTitleArray[a] titleImageSpace:5 imagePosition:QMUIButtonImagePositionRight font:12 backgroundColor:WhiteColor titleColor:BlackColor];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+a;
        [self sd_addSubviews:@[button]];
        button.sd_layout
        .leftSpaceToView(self, a * SCREEN_WIDTH/4)
        .topEqualToView(self)
        .heightIs(41)
        .widthIs(SCREEN_WIDTH/4);
    }
    for (int b = 0; b < 3; b ++) {
        UIView *line = [UIView new];
        line.backgroundColor = Color(@"#c4c4c4");
        [self sd_addSubviews:@[line]];
        line.sd_layout
        .leftSpaceToView(self, (b+1) * SCREEN_WIDTH/4)
        .centerYIs(20.5)
        .heightIs(31)
        .widthIs(0.5);
        [self bringSubviewToFront:line];
    }
    UIView *lineA = [UIView new];
    lineA.backgroundColor = Color(@"#c4c4c4");
    [self sd_addSubviews:@[lineA]];
    lineA.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self, 41)
    .heightIs(0.5);
    
    self.colView = [RCBookStoreSearchCollectionView new];
    [self sd_addSubviews:@[self.colView]];
    self.colView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(lineA, 0)
    .bottomEqualToView(self);
    
    [self dealAction];
}

- (void)buttonClick:(UIButton *)sender {
    if ([self.searchDelegate respondsToSelector:@selector(bookStoreSearchClick)]) {
        [self.searchDelegate bookStoreSearchClick];
    }
    if (!self.open) {
        [UIView animateWithDuration:0.5 animations:^{
            sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        self.open = YES;
        switch (sender.tag) {
            case 100+0:
                self.colView.dataArray = self.clumOneArray;
                break;
            case 100+1:
                self.colView.dataArray = self.clumTwoArray;
                break;
            case 100+2:
                self.colView.dataArray = self.clumThreeArray;
                break;
            case 100+3:
                self.colView.dataArray = self.clumFourArray;
                break;
                
            default:
                break;
        }
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            sender.imageView.transform = CGAffineTransformIdentity;
        }];
        self.open = NO;
    }
}
- (void)dealAction {
//    self.colView.buttonView.rightButton.onClick(^{
//        self.colView.hidden = YES;
//        self.colView.sd_layout.heightIs(0);
//    });
}

- (QMUIButton *)creatQMUIBtnWithImage:(NSString *)imageName title:(NSString *)title  titleImageSpace:(float)space imagePosition:(QMUIButtonImagePosition)imagePosition font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor {
    QMUIButton  *button = [[QMUIButton alloc] init];
    button.layer.cornerRadius = 0;
    button.layer.masksToBounds = YES;
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

@interface RCBookStoreSearchCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>
@end
@implementation RCBookStoreSearchCollectionView
- (void)loadSubViews {
    self.backgroundColor = RGB_A_COLOR(0, 0, 0, 0.3);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.dataCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    self.dataCollection.backgroundColor = WhiteColor;
    self.dataCollection.delegate = self;
    self.dataCollection.dataSource = self;
    self.dataCollection.scrollEnabled = YES;
    [self.dataCollection registerClass:[RCBookStoreSearchViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self sd_addSubviews:@[self.dataCollection]];
    self.dataCollection.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(self, 0)
    .heightIs(63);
    UIView *lineB = [UIView new];
    lineB.backgroundColor = Color(@"#c4c4c4");
    [self sd_addSubviews:@[lineB]];
    lineB.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.dataCollection, 0)
    .heightIs(0.5);
    
    self.buttonView = [RCLeftAndRightButtonView new];
    [self sd_addSubviews:@[self.buttonView]];
    self.buttonView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(lineB, 0)
    .heightIs(45);
}

#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RCBookStoreSearchViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.itemName.text = self.dataArray[indexPath.item];
    return cell;
}

#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-56)/3, 35);
}
#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(14, 14, 14, 14);//（上、左、下、右）
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 14;
}
#pragma mark  定义每个UICollectionView的竖向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 14;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.dataCollection reloadData];
}
@end
@implementation RCBookStoreSearchViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews {
    self.backgroundColor = ThemeColor;
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    self.itemName = Label.fnt(11).color(@"#000000");
    self.itemName.textAlignment = NSTextAlignmentCenter;
    self.itemName.layer.borderWidth = 0.5;
    self.itemName.layer.borderColor = BlackColor.CGColor;
    self.itemName.layer.cornerRadius = 3;
    self.itemName.layer.masksToBounds = YES;
    [self sd_addSubviews:@[self.itemName]];
    self.itemName.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self);
    
}
@end
