//
//  RCFlitterVC.m
//  ReaderCat
//
//  Created by guojz on 2018/5/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCFlitterVC.h"
#import "QZConditionFilterView.h"

@interface RCFlitterVC ()
{
    // *存储* 网络请求url中的筛选项 数据来源：View中_dataSource1或者一开始手动的初值
    NSArray *_selectedDataSource1Ary;
    NSArray *_selectedDataSource2Ary;
    NSArray *_selectedDataSource3Ary;
    
    QZConditionFilterView *_conditionFilterView;
}
@end

@implementation RCFlitterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showNavigationBar];
    [self hideNVBarShadow];
    self.title = self.fliterTitle;
    [self configSubviews];
  
}

- (void)configSubviews {
    _conditionFilterView = [QZConditionFilterView conditionFilterViewWithFilterBlock:^(BOOL isFilter, NSArray *dataSource1Ary, NSArray *dataSource2Ary, NSArray *dataSource3Ary) {
        
        // 1.isFilter = YES 代表是用户下拉选择了某一项
        // 2.dataSource1Ary 选择后第一组选择的数据  2 3一次类推
        // 3.如果你的项目没有清空筛选条件的功能，可以无视else 我们的app有清空之前的条件，重置，所以才有else的逻辑
        
        if (isFilter) {
            //网络加载请求 存储请求参数
            _selectedDataSource1Ary = dataSource1Ary;
            _selectedDataSource2Ary = dataSource2Ary;
            _selectedDataSource3Ary = dataSource3Ary;
        }else{
            // 不是筛选，全部赋初值（在这个工程其实是没用的，因为tableView是选中后必选的，即一旦选中就没有空的情况，但是如果可以清空筛选条件的时候就有必要 *重新* reset data）
            _selectedDataSource1Ary = @[@"默认条件"];
            _selectedDataSource2Ary = @[@"默认条件"];
            _selectedDataSource3Ary = @[@"默认条件"];
        }
        
        // 开始网络请求
        [self startRequest];
    }];
    _conditionFilterView.y += 0;
    
    // 设置初次加载显示的默认数据 即初次加载还没有选择操作之前要显示的标题数据
    _selectedDataSource1Ary = @[@"排序"];
    _selectedDataSource2Ary = @[@"状态"];
    _selectedDataSource3Ary = @[@"字数"];
    
    // 传入数据源，对应三个tableView顺序
    _conditionFilterView.dataAry1 = @[@"默认排序",@"热度最高",@"最近更新"];
    _conditionFilterView.dataAry2 = @[@"全部",@"完结",@"连载"];
    _conditionFilterView.dataAry3 = @[@"全部",@"100万字以上",@"50-100万字",@"0-50万字"];
    
    // 初次设置默认显示数据(标题)，内部会调用block 进行第一次数据加载
    [_conditionFilterView bindChoseArrayDataSource1:_selectedDataSource1Ary DataSource2:_selectedDataSource2Ary DataSource3:_selectedDataSource3Ary];
    
    [self.view addSubview:_conditionFilterView];
}
- (void)startRequest
{
        
    NSString *source1 = [NSString stringWithFormat:@"%@",_selectedDataSource1Ary.firstObject];
    NSString *source2 = [NSString stringWithFormat:@"%@",_selectedDataSource2Ary.firstObject];
    NSString *source3 = [NSString stringWithFormat:@"%@",_selectedDataSource3Ary.firstObject];
    NSDictionary *dic = [_conditionFilterView keyValueDic];
        // 可以用字符串在dic换成对应英文key
    NSLog(@"\n第一个条件:%@\n  第二个条件:%@\n  第三个条件:%@\n",source1,source2,source3);
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
