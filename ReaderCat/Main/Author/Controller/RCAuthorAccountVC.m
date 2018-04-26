//
//  RCAuthorAccountVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/17.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCAuthorAccountVC.h"
#import "RCAuthorAccountCell.h"
#import "RCAuthorAccountHeadView.h"
#import "JCCalenderView.h"

@interface RCAuthorAccountVC ()
@property (nonatomic, strong) NSMutableArray                 *dataArray;
@property (nonatomic, strong) UITableView                    *accountTable;
@property (nonatomic, strong) RCAuthorAccountHeadView        *headView;

@end

@implementation RCAuthorAccountVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)accountTable{
    if(!_accountTable){
        
        _accountTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
        _accountTable.backgroundColor = DEFAULT_BG_COLOR;
        _accountTable.separatorStyle  = UITableViewCellSeparatorStyleNone;
        //适配iOS11 中table的底部
        _accountTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.0001)];
        AdjustsScrollViewInsetNever(self, _accountTable);
        [self.view addSubview:_accountTable];
    }
    return _accountTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"作家账户";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    [self.accountTable assembly:^(RCAuthorAccountCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.bookName.text = model;
        cell.timeBtn.onClick(^{
            JCCalenderView *calenderView = [JCCalenderView new];
            calenderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [self.view addSubview:calenderView];
            [calenderView timeSelectedButtonAction];
            calenderView.returnDateBlock = ^(NSString *dateValue) {
                [cell.timeBtn setTitle:dateValue forState:UIControlStateNormal];
            };
        });
    } withPlug:RCAuthorAccountCell.class];
    
    [self.accountTable setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 150;
    }];
    [[self.accountTable setViewForHeaderInSection:^UIView *(UITableView *tableView, NSInteger section) {
        return [RCAuthorAccountHeadView new];
    }]setSectionHeaderHeight:171] ;
    [[self.accountTable setViewForFooterInSection:^UIView *(UITableView *tableView, NSInteger section) {
        UIView *footView = [UIView new];
        footView.backgroundColor = WhiteColor;
        UILabel *footerTitle = Label.fnt(12).color(@"#323232").str(@"收入查询说明");
        footerTitle.backgroundColor = WhiteColor;
        UITextView *tipView = [UITextView new];
        tipView.textAlignment = NSTextAlignmentJustified;
        tipView.fnt(10).color(@"#969696").str(@"1、显示“已支付”状态的，就是钱已经汇出来了；显示“待支付”状态的，就是正在整理资料中，马上支付；显示“信息不全”，就 是作者的汇款资料不齐无法支付；显示“累计支付“状态的，就是当月稿酬没超过200元，将累计至下月一起支付。\n2、目前无法查询当月的稿酬数据，次月方可查询。\n3、自有平台是指网站所拥有的平台，包含网站版、安卓端等。\n4、奖励保障是指网站的所拥有的福利，包含全勤奖，勤奋写作奖，完本金，打赏等。\n5、第三方渠道是指非的外部渠道销售，包含中移动阅读基地，电信天翼阅读，掌阅等。\n6、版权收入是指作品进行其他版权交易所产生的收入，包含简、繁体出版，游戏改编，影视剧改编等。");
        [footView sd_addSubviews:@[footerTitle,tipView]];
        footerTitle.sd_layout
        .leftSpaceToView(footView, 15)
        .topSpaceToView(footView, 15)
        .heightIs(13)
        .rightSpaceToView(footView, 15);
        tipView.sd_layout
        .leftEqualToView(footerTitle)
        .rightEqualToView(footerTitle)
        .bottomEqualToView(footView)
        .topSpaceToView(footerTitle, 0);
        return footView;
    }]setSectionFooterHeight:200];
    [[[[self.accountTable didSelectRowAtIndexPathSignal] reduceEach:^id (UITableView *tableView ,NSIndexPath *indexPath){
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
    self.accountTable.data = [NSArray arrayWithObjects:@"西游记",@"水浒传",@"三国演义",@"红楼梦",@"围城", nil];
    [self.accountTable reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
