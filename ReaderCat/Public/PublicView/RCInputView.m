//
//  RCInputView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCInputView.h"

@implementation RCInputView
- (void)loadSubViews {
    _leftImage = [UIImageView new];
    _leftImage.contentMode = UIViewContentModeCenter;
    _inputtextfield = TextField.fnt(13).color(@"#333333");
    _inputtextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _lineView = [UIView new];
    _lineView.backgroundColor = Color(@"#cccccc");
    [self sd_addSubviews:@[_leftImage, _inputtextfield,_lineView]];
    
    _leftImage.sd_layout
    .leftSpaceToView(self, 10)
    .centerYEqualToView(self)
    .widthIs(23)
    .heightEqualToWidth();
    
    _inputtextfield.sd_layout
    .leftSpaceToView(_leftImage, 10)
    .centerYEqualToView(_leftImage)
    .rightSpaceToView(self, 10)
    .heightRatioToView(self, 1);
    
    _lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(0.5);
}

-(void)setLeftImage:(NSString *)leftImage placeHolder:(NSString *)placeHolder {
    self.leftImage.img(leftImage);
    self.inputtextfield.placeholder = placeHolder;
    [self layoutSubviews];
}
@end
