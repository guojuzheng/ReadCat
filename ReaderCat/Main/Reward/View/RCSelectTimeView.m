//
//  RCSelectTimeView.m
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCSelectTimeView.h"
@interface RCSelectTimeView()
@property (nonatomic, assign)NSInteger        timeSpace;
@end
@implementation RCSelectTimeView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.backgroundColor = WhiteColor;
    [self.leftBtn setTitle:@"上个月" forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:Color(@"#000000") forState:UIControlStateNormal];
    [self.leftBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.leftBtn addTarget:self action:@selector(reduceMonth) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.backgroundColor = WhiteColor;
    [self.rightBtn setTitle:@"下个月" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:Color(@"#000000") forState:UIControlStateNormal];
    [self.rightBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.rightBtn addTarget:self action:@selector(addMonth) forControlEvents:UIControlEventTouchUpInside];
    self.centerLabel = Label.fnt(12).color(@"#000000").str(@"");
    self.centerLabel.backgroundColor = ThemeColor;
    self.centerLabel.textAlignment = NSTextAlignmentCenter;
    self.centerLabel.layer.borderWidth=1;
    self.centerLabel.layer.borderColor = BlackColor.CGColor;
    self.centerLabel.layer.cornerRadius = 5;
    self.centerLabel.layer.masksToBounds = YES;
    [self sd_addSubviews:@[self.leftBtn,self.rightBtn,self.centerLabel]];
    self.leftBtn.sd_layout
    .leftSpaceToView(self, 10)
    .centerYEqualToView(self)
    .heightIs(20)
    .widthIs(50);
    self.rightBtn.sd_layout
    .rightSpaceToView(self, 10)
    .centerYEqualToView(self)
    .heightIs(20)
    .widthIs(50);
    self.centerLabel.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .widthRatioToView(self, 0.3)
    .heightIs(23);
    self.timeSpace = 0;
    [self configViewWithTimeSpace:self.timeSpace];
}

- (NSString *)configViewWithTimeSpace:(NSInteger)timeSpace {
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    //    [lastMonthComps setYear:1]; // year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    [lastMonthComps setMonth:self.timeSpace];
    NSDate *newdate = [calendar dateByAddingComponents:lastMonthComps toDate:currentDate options:0];
    NSString *dateStr = [formatter stringFromDate:newdate];
    NSArray *dateArray = [dateStr componentsSeparatedByString:@"-"];
    self.centerLabel.text = [NSString stringWithFormat:@"%@年%@月",dateArray[0],dateArray[1]];
    return dateStr;
}

- (void)addMonth {
    self.timeSpace += 1;
    NSString *dateStr = [self configViewWithTimeSpace:self.timeSpace];
    if (self.selectedTimeBlock) {
        self.selectedTimeBlock(dateStr);
    }
}

- (void)reduceMonth {
    self.timeSpace -= 1;
    NSString *dateStr = [self configViewWithTimeSpace:self.timeSpace];
    if (self.selectedTimeBlock) {
        self.selectedTimeBlock(dateStr);
    }
}
@end
