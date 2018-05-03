//
//  RCClassify.m
//  ReaderCat
//
//  Created by guojz on 2018/4/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCClassify.h"
#import "RCClassifyCell.h"
#import "RCFlitterVC.h"

@interface RCClassify ()<UITableViewDelegate, UITableViewDataSource,UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UITableView *menuView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray          *collectionData;
@end

@implementation RCClassify

- (NSArray *)collectionData {
    if (!_collectionData) {
        _collectionData = [NSArray array];
    }
    return _collectionData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"分类";
    [self showNavigationBar];
    [self hideNVBarShadow];
    [self configSubviews];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)configSubviews {
    UITableView *menuView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, SCREEN_HEIGHT)];
    menuView.delegate = self;
    menuView.dataSource = self;
    menuView.showsVerticalScrollIndicator = NO;
    menuView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:menuView];
    [menuView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    self.menuView = menuView;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat itemW = SCREEN_WIDTH-100;
    flowLayout.itemSize = CGSizeMake(itemW, 60);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    flowLayout.minimumLineSpacing = 5.0;
    flowLayout.minimumInteritemSpacing = 0.0;
//    flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH - 100, 35);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH - 100, SCREEN_HEIGHT-NavigationBarHeight-StatusBarHeight) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
//    collectionView.emptyDataSetSource = self;
    collectionView.alwaysBounceVertical = YES;
    collectionView.contentInset = UIEdgeInsetsMake(0, 0, 10 * 2, 0);
    [self.view addSubview:collectionView];
    [collectionView registerClass:[RCClassifyCell class] forCellWithReuseIdentifier:@"cellID"];
    self.collectionView = collectionView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"男生";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"女生";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        //男生
        self.collectionData = @[@"都市职场",@"玄幻奇幻",@"武侠仙侠",@"历史军事",@"游戏竞技",@"科幻灵异"];
    } else if (indexPath.row == 1) {
        //女生
         self.collectionData = @[@"现代言情",@"古代言情",@"浪漫青春",@"仙侠奇缘",@"悬疑灵异",@"耽美同人"];
    }
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RCClassifyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.classifyName.text = self.collectionData[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    RCFlitterVC *flitterVC = [RCFlitterVC new];
    flitterVC.fliterTitle = self.collectionData[indexPath.item];
    [self pushVC:flitterVC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
