//
//  BaseView.m
//  JupuCircle
//
//  Created by 樊星 on 2017/9/25.
//  Copyright © 2017年 樊星. All rights reserved.
//

#import "BaseView.h"

@interface BaseView()
@end

@implementation BaseView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self loadSubViews];
    }
    return self;
}

-(instancetype) initWithNibFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
        self.frame = frame;
    }
    return self;
}

-(MyLinearLayout *)lineLayout{
    if(!_lineLayout){
        _lineLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
        _lineLayout.padding = UIEdgeInsetsMake(0, 0, 0, 0); //设置布局内的子视图离自己的边距.
        _lineLayout.myHorzMargin = 0;                       //同时指定左右边距为0表示宽度和父视图一样宽
        _lineLayout.myVertMargin = 0;
        _lineLayout.heightSize.lBound(self, 1, 1);          //高度虽然是wrapContentHeight的。但是最小的高度不能低于父视图的高度加10.
        [self addSubview:_lineLayout];
    }
    return _lineLayout;
}

-(void)setMyFrameTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right{
    top>=0?    self.myTop      = top    :1;
    left>=0?   self.myLeading  = left   :1;
    right>=0?  self.myTrailing = right  :1;
    bottom>=0? self.myBottom   = bottom :1;
}
-(void)loadSubViews{}
@end
