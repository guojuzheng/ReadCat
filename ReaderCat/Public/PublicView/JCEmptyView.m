//
//  JCEmptyView.m
//  JupuCircle
//
//  Created by 樊星 on 2017/10/9.
//  Copyright © 2017年 樊星. All rights reserved.
//

#import "JCEmptyView.h"

@implementation JCEmptyView

-(void)loadSubViews{
    
    _emptyImage = ImageView.img(@"empty_view_image");
    _emptyImage.contentMode= UIViewContentModeCenter;
    
    _remindLabel = Label.fnt(14).color(@"#666666");
    _remindLabel.textAlignment = NSTextAlignmentCenter;
    
    [self sd_addSubviews:@[_emptyImage, _remindLabel]];
    
    _emptyImage.sd_layout
    .topEqualToView(self)
    .centerXEqualToView(self)
    .heightIs(SCALE_HEIGHT(89))
    .widthIs(SCALE_HEIGHT(139.5));
    
    _remindLabel.sd_layout
    .topSpaceToView(_emptyImage, SCALE_HEIGHT(26))
    .centerXEqualToView(_emptyImage)
    .heightIs(14)
    .widthIs(200);
    
    self.backgroundColor = DEFAULT_BG_COLOR;
}

@end
