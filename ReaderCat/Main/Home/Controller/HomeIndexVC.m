//
//  HomeVC.m
//  APPFoundation
//
//  Created by guojz on 2018/2/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "HomeIndexVC.h"
#import "RCTopView.h"
#import "CustomCollectionViewFlowLayout.h"
#import "RCHomeBannerCell.h"
#import "RCHomeAuthorRecommendCell.h"
#import "RCHomeGoodRecommendCell.h"
#import "RCHomeSeeMoreCell.h"
#import "RCHomeClassifyCell.h"
#import "RCRookInfoVC.h"
#import "RCSearchBookVC.h"
#import "RCBookStoreVC.h"
#import "RCClassify.h"

@interface HomeIndexVC ()<UICollectionViewDelegate, UICollectionViewDataSource, CustomCollectionViewDelegateFlowLayout>
@property (nonatomic, strong) RCTopView *customNavBar;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation HomeIndexVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor clearColor];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureSubviews];
}

- (void)configureSubviews {
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CustomCollectionViewFlowLayout *flowLayout = [[CustomCollectionViewFlowLayout alloc]init];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TabBarHeight) collectionViewLayout:flowLayout];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = DEFAULT_BG_COLOR;
    collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;

    AdjustsScrollViewInsetNever(self, collectionView)
    
    self.customNavBar = [RCTopView new];
    self.customNavBar.frame= CGRectMake(0, 0, SCREEN_WIDTH, StatusBarHeight + NavigationBarHeight);
    [self.view addSubview:self.customNavBar];
    [self registerCells];
}

- (void)registerCells {
    [self.collectionView registerClass:[RCHomeBannerCell class] forCellWithReuseIdentifier:@"homeBannerID"];
    [self.collectionView registerClass:[RCHomeAuthorRecommendCell class] forCellWithReuseIdentifier:@"homeAuthorRecID"];
    [self.collectionView registerClass:[RCHomeGoodRecommendCell class] forCellWithReuseIdentifier:@"homeGoodRecID"];
    [self.collectionView registerClass:[RCHomeSeeMoreCell class] forCellWithReuseIdentifier:@"homeSeeMoreID"];
    [self.collectionView registerClass:[RCHomeClassifyCell class] forCellWithReuseIdentifier:@"homeClassifyID"];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"customID"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section ==  1) {
        return 1;
    } else if (section == 2) {
        return 3;
    } else if (section == 3) {
        return 4;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        RCHomeBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeBannerID" forIndexPath:indexPath];
        cell.imageArray = [NSArray arrayWithObjects:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3545834692,4156954932&fm=27&gp=0.jpg",@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4028083546,1597141517&fm=27&gp=0.jpg",@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=774373677,2313985244&fm=27&gp=0.jpg",@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3745996930,2042574462&fm=27&gp=0.jpg",nil];
        return cell;
    } else  if (indexPath.section == 1) {
        RCHomeAuthorRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeAuthorRecID" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 2) {
        if (indexPath.item == 3) {
            RCHomeSeeMoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeSeeMoreID" forIndexPath:indexPath];
            return cell;
        } else {
            RCHomeGoodRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeGoodRecID" forIndexPath:indexPath];
            return cell;
        }
    } else if (indexPath.section == 3){
        RCHomeClassifyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeClassifyID" forIndexPath:indexPath];
        return cell;
    } else {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customID" forIndexPath:indexPath];
        cell.backgroundColor = ThemeColor;
        return cell;
    }
 
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 || indexPath.section == 2) {
        [self.navigationController pushViewController:[RCRookInfoVC new] animated:YES];
    } else if (indexPath.section == 3) {
        [self.navigationController pushViewController:[RCClassify new] animated:YES];
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(SCREEN_WIDTH, 307);
    } else if (indexPath.section == 1) {
        return CGSizeMake(SCREEN_WIDTH, 277);
    } else if (indexPath.section == 2) {
        if (indexPath.item == 3) {
            return CGSizeMake(SCREEN_WIDTH, 41);
        } else {
             return CGSizeMake(SCREEN_WIDTH, 108);
        }
    } else if (indexPath.section == 3) {
        return CGSizeMake(SCREEN_WIDTH/2, 91);
    }
    return CGSizeMake(0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 5, 0);//分别为上、左、下、右
}

- (UICollectionReusableView*)collectionView: (UICollectionView*)collectionView viewForSupplementaryElementOfKind: (NSString*)kind atIndexPath: (NSIndexPath*)indexPath

{
    
    UICollectionReusableView *reusableView =nil;
    
    if(kind ==UICollectionElementKindSectionHeader){
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier: @"headerView" forIndexPath: indexPath];
        headerView.backgroundColor = WhiteColor;
        NSString *headString;
        if (indexPath.section == 2) {
            headString = @"精品推荐";
        } else if (indexPath.section == 3) {
            headString = @"猜你感兴趣的分类";
        }
        UILabel *lab = Label.fnt(15).color(@"#010101").str(headString);
        lab.frame = CGRectMake(15, 0, SCREEN_WIDTH, 41);
        [headerView addSubview:lab];
        UIView *line = [UIView new];
        line.backgroundColor = DEFAULT_BG_COLOR;
        line.frame = CGRectMake(0, 40.5, SCREEN_WIDTH, 0.5);
        [headerView addSubview:line];
        
        reusableView = headerView;
        
    }
    
    return reusableView;
    
}

-(CGSize)collectionView: (UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection: (NSInteger)section{
    if (section == 2 || section == 3) {
        return CGSizeMake(SCREEN_WIDTH, 41);
    }
    return CGSizeZero;
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    self.customNavBar.hidden = offsetY < -20;
    self.customNavBar.barAlpha = offsetY / 200.0;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

