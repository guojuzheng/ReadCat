//
//  JCQMUIFillButton.m
//  JupuCircle
//
//  Created by 樊星 on 2017/10/11.
//  Copyright © 2017年 樊星. All rights reserved.
//

#import "JCQMUIFillButton.h"

@implementation JCQMUIFillButton
+(JCQMUIFillButton *)JCQMUIFillButtonWihtMyTop:(CGFloat)myTop myLeft:(CGFloat)myLeft myRight:(CGFloat)myRight andMyHeight:(CGFloat)myHeight{
    
    JCQMUIFillButton *fillButton = [[JCQMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:WhiteColor];
    
    fillButton.cornerRadius = 3.5;
    fillButton.myTop = SCALE_HEIGHT(myTop);
    fillButton.myLeft = SCALE_WIDTH(myLeft);
    fillButton.myRight = SCALE_WIDTH(myRight);
    fillButton.myHeight = SCALE_HEIGHT(myHeight);
    
    return fillButton;
}

+(JCQMUIFillButton *)QMUIFillButtonBlueWithTitle:(NSString *)title{
    
    JCQMUIFillButton *fillButton = [[JCQMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:WhiteColor];
    
    fillButton.cornerRadius = 3.5;
    
    fillButton.fnt(SixteenFontSize);
    
    [fillButton setTitle:title forState:UIControlStateNormal];
    
    return fillButton;
}

+(JCQMUIFillButton *)JCQMUIFillButtonBlueWithTitle:(NSString *)title andTimeCount:(NSInteger)timeCount{
    
    JCQMUIFillButton *fillButton = [[JCQMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:WhiteColor];
    
    [fillButton setTitle:title andTimeCount:timeCount];
    
    fillButton.cornerRadius = 3.5;
    
    fillButton.fnt(SixteenFontSize);
    
    return fillButton;
}

+(JCQMUIFillButton *)JCQMUIFillButtonWithTitle:(NSString *)title andTimeCount:(NSInteger)timeCount{
    
    JCQMUIFillButton *fillButton = [[JCQMUIFillButton alloc] init];
    
    [fillButton setTitleColor:ThemeColor forState:UIControlStateNormal];
    
    [fillButton setBackgroundImage:[UIImage qmui_imageWithColor:DEFAULT_BG_COLOR] forState:UIControlStateNormal];
    
    [fillButton setTitle:title andTimeCount:timeCount];
    
    fillButton.cornerRadius = 3.5;
    
    fillButton.fnt(SixteenFontSize);
    
    return fillButton;
}

-(void)setMyTop:(CGFloat)myTop myLeft:(CGFloat)myLeft myRight:(CGFloat)myRight andMyHeight:(CGFloat)myHeight{
    
    self.myTop = SCALE_HEIGHT(myTop);
    self.myLeft = SCALE_WIDTH(myLeft);
    self.myRight = SCALE_WIDTH(myRight);
    self.myHeight = SCALE_HEIGHT(myHeight);
}

-(void)setTitle:(NSString *)title andTimeCount:(NSInteger)timeCount{
    
    _timeCount = timeCount;
    
    [self setTitle:title forState:UIControlStateNormal];
    
    self.timeCountEnd = [RACReplaySubject subject];
    self.beginTimeCount = [RACReplaySubject subject];
    
    if(_timeCount>0){
       
        [self.beginTimeCount subscribeNext:^(id  _Nullable x) {
           
            __block NSInteger count = _timeCount;
            self.str(Str(@"%lds后重新获取", count));
            count--;
            [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] take:count] subscribeNext:^(id x) {
                self.str(Str(@"%lds后重新获取", count));
                count--;
                if (count <= 0) {
                    self.str(title);
                    [self.timeCountEnd sendNext:nil];
                }
            }];
        }];
    }
}


@end
