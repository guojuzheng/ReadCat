//
//  RCRewardAuthorVC.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardAuthorVC.h"
#import "RCSegmentView.h"
#import "RCRewardInfoCell.h"
#import "RCRewardHeadView.h"
#import "RCRewardBallotHead.h"

@interface RCRewardAuthorVC ()
@property (nonatomic, strong) RCSegmentView         *segmentView;
@property (nonatomic, strong) NSMutableArray        *dataArray;
@property (nonatomic, strong) UITableView           *rewardTableView;
@property (nonatomic, strong) RCRewardHeadView      *tableHeadView;
@property (nonatomic, strong) RCRewardBallotHead    *tableBallotHeadView;
@property (nonatomic, assign) NSInteger             flag;
@end

@implementation RCRewardAuthorVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)rewardTableView{
    if(!_rewardTableView){
        
        _rewardTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
        _rewardTableView.backgroundColor = DEFAULT_BG_COLOR;
        _rewardTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        //适配iOS11 中table的底部
        AdjustsScrollViewInsetNever(self, _rewardTableView);
        self.tableHeadView = [RCRewardHeadView new];
        self.tableHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 161);
        _rewardTableView.tableHeaderView = self.tableHeadView;
        [self.view addSubview:_rewardTableView];
    }
    return _rewardTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"打赏作者";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    self.flag = 0;
    self.segmentView = [RCSegmentView new];
    [self.segmentView setSegmentTitle:@[@"打赏",@"推荐票"]];
    WeakifySelf();
    self.segmentView.segmentBlock = ^(NSInteger selectedIndex) {
        if (selectedIndex == 0) {
            weakSelf.flag = 0;
            weakSelf.tableHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 166);
            weakSelf.rewardTableView.tableHeaderView = weakSelf.tableHeadView;
        } else if (selectedIndex == 1) {
            weakSelf.flag = 1;
            weakSelf.tableBallotHeadView = [RCRewardBallotHead new];
            weakSelf.tableBallotHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 213);
            weakSelf.rewardTableView.tableHeaderView = weakSelf.tableBallotHeadView;
        }
        [weakSelf.rewardTableView reloadData];
    };
    [self.view sd_addSubviews:@[self.segmentView]];
    self.segmentView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .heightIs(41);
    
    [self.rewardTableView assembly:^(RCRewardInfoCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.nameLabel.text = model;
    } withPlug:RCRewardInfoCell.class];
    
    [self.rewardTableView setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 64;
    }];
    [[[[self.rewardTableView didSelectRowAtIndexPathSignal] reduceEach:^id (UITableView *tableView ,NSIndexPath *indexPath){
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
    [[self.rewardTableView setViewForHeaderInSection:^UIView *(UITableView *tableView, NSInteger section) {
        UILabel *sectionTitle = Label.fnt(14).color(@"#010101").str(@"    最近打赏");
        sectionTitle.backgroundColor = WhiteColor;
        return sectionTitle;
    }] setSectionHeaderHeight:40];
    self.rewardTableView.data = [NSArray arrayWithObjects:@"小红",@"唐家三少", nil];
    [self.rewardTableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
