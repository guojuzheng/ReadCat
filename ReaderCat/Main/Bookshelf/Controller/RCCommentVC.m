//
//  RCCommentVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCCommentVC.h"

@interface RCCommentVC ()<UITextViewDelegate>
@property (nonatomic, strong) MyLinearLayout     *contentLayout;
@property (nonatomic, strong) UITextView         *commentView;
@property (nonatomic, strong) QMUIFillButton     *sendComentBtn;
@end

@implementation RCCommentVC

-(MyLinearLayout *)contentLayout{
    if(!_contentLayout){
        _contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
        _contentLayout.padding = UIEdgeInsetsMake(0, 0, 0, 0);    //设置布局内的子视图离自己的边距.
        _contentLayout.myHorzMargin = 0;                          //同时指定左右边距为0表示宽度和父视图一样宽
        _contentLayout.heightSize.lBound(self.scrollView.heightSize, 10, 1); //高度虽然是wrapContentHeight的。但是最小的高度不能低于父视图的高度加10.
        [self.scrollView addSubview:_contentLayout];
    }
    return _contentLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"填写评论";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
    [self dealAction];
}

- (void)configSubviews {
    self.commentView = [UITextView new];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 5;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    self.commentView.typingAttributes = attributes;
    self.commentView.delegate = self;
    self.commentView.backgroundColor = WhiteColor;
    self.commentView.myHorzMargin = 0;
    self.commentView.myTop = 5;
    self.commentView.myHeight = 145;
    [self.contentLayout addSubview:self.commentView];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = WhiteColor;
    bgView.myHorzMargin = 0;
    bgView.myTop = 1;
    bgView.myHeight = 52;
    [self.contentLayout addSubview:bgView];
    
    self.sendComentBtn = [[QMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:Color(@"#000000")];
    self.sendComentBtn.fnt(FifteenFontSize);
    self.sendComentBtn.layer.borderColor = Color(@"#000000").CGColor;
    self.sendComentBtn.layer.borderWidth = 1;
    [self.sendComentBtn setTitle:@"发表评论" forState:UIControlStateNormal];
    self.sendComentBtn.cornerRadius = 3.5;
    [bgView sd_addSubviews:@[self.sendComentBtn]];
    self.sendComentBtn.sd_layout
    .rightSpaceToView(bgView, 15)
    .centerYEqualToView(bgView)
    .heightIs(30)
    .widthIs(91);
    
}

- (void)dealAction {
    self.sendComentBtn.onClick(^ {
        
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
