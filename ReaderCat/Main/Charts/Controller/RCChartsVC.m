//
//  RCChartsVC.m
//  ReaderCat
//
//  Created by guojz on 2018/3/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//
/**
  * 榜单
 **/
#import "RCChartsVC.h"
#import "RCChartsCell.h"
#import "RCBannerView.h"

@interface RCChartsVC ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *chartsList;
@end

@implementation RCChartsVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)chartsList{
    if(!_chartsList){
        
        _chartsList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
        _chartsList.backgroundColor = DEFAULT_BG_COLOR;
        _chartsList.separatorStyle  = UITableViewCellSeparatorStyleNone;
        //适配iOS11 中table的底部
        AdjustsScrollViewInsetNever(self, _chartsList);
        RCBannerView *bannerView = [RCBannerView new];
        bannerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 108);
        bannerView.imageArray = @[
                                  
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf=425,260,50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf=425,260,50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  
                                  @"http://c.hiphotos.baidu.com/image/w=400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  
                                  ];
        _chartsList.tableHeaderView = bannerView;
        
        [self.view addSubview:_chartsList];
    }
    return _chartsList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self ShowNVBar];
    [self loadNewData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"榜单";
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    [self.chartsList assembly:^(RCChartsCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.chartsTitle.text = model;
    } withPlug:RCChartsCell.class];
    
    [self.chartsList setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 76;
    }];
    [self.chartsList setHeightForHeaderInSection:^CGFloat(UITableView *tableView, NSInteger section) {
        return 5;
    } ];
    [[[[self.chartsList didSelectRowAtIndexPathSignal] reduceEach:^id (UITableView *tableView ,NSIndexPath *indexPath){
        if (self.dataArray.count != 0) {
            id objc = self.dataArray[indexPath.row];
            return objc;
        } else {
            return nil;
        }
        
    }] filter:^BOOL(id  _Nullable value) {
        return YES;
    }] subscribeNext:^(id x) {
        if (x != nil) {
            //            JCInsuranceBillDetailVC *billDetailVC = [JCInsuranceBillDetailVC new];
            //            billDetailVC.orderId = x.orderId;
            //            [self pushVC:billDetailVC];
        }
    }];
    self.chartsList.data = [NSArray arrayWithObjects:@"西游记",@"水浒传",@"三国演义",@"红楼梦",@"围城", nil];
    [self.chartsList reloadData];
}

- (void)loadNewData {
    
}

#pragma mark ================= 路由跳转 =================
+ (void)load{
    [super load];
    [[GMRouter shared]map:URL_SCHEMA_CHARTS toBlock:^id(NSDictionary *params) {
        RCChartsVC *vc = [RCChartsVC new];
        return vc;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
