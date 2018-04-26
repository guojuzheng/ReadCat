//
//  JCQMUIFillButton.h
//  JupuCircle
//
//  Created by 樊星 on 2017/10/11.
//  Copyright © 2017年 樊星. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

@interface JCQMUIFillButton : QMUIFillButton
@property (nonatomic, assign) NSInteger timeCount;
@property (nonatomic, strong) RACReplaySubject *timeCountEnd;
@property (nonatomic, strong) RACReplaySubject *beginTimeCount;
+(JCQMUIFillButton *)JCQMUIFillButtonWihtMyTop:(CGFloat)myTop myLeft:(CGFloat)myLeft myRight:(CGFloat)myRight andMyHeight:(CGFloat)myHeight;
+(JCQMUIFillButton *)JCQMUIFillButtonBlueWithTitle:(NSString *)title andTimeCount:(NSInteger)timeCount;
+(JCQMUIFillButton *)JCQMUIFillButtonWithTitle:(NSString *)title andTimeCount:(NSInteger)timeCount;
+(JCQMUIFillButton *)QMUIFillButtonBlueWithTitle:(NSString *)title;
-(void)setMyTop:(CGFloat)myTop myLeft:(CGFloat)myLeft myRight:(CGFloat)myRight andMyHeight:(CGFloat)myHeight;
@end
