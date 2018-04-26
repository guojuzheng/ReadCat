//
//  DZMRMTopView.swift
//  DZMeBookRead
//
//  Created by 邓泽淼 on 2017/5/11.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

class DZMRMTopView: DZMRMBaseView {

    /// 返回按钮
    private(set) var back:UIButton!
    
    ///订阅
    private(set) var subscribe:UIButton!
    ///评论
    private(set) var comment:UIButton!
    
    /// 书签
    private(set) var mark:UIButton!
    
    override func addSubviews() {
        
        super.addSubviews()
        
        // 返回
        back = UIButton(type:.custom)
        back.setImage(UIImage(named:"white_back_image"), for: .normal)
        addSubview(back)
        //订阅
        subscribe = UIButton(type: .custom)
        subscribe.setImage(UIImage(named: "read_now"), for: .normal)
        subscribe.addTarget(self, action: #selector(DZMRMTopView.clickSubscribe(button:)), for: .touchUpInside)
        addSubview(subscribe)
        //评论
        comment = UIButton(type: .custom)
        comment.setImage(UIImage(named: "comment"), for: .normal)
        comment.addTarget(self, action: #selector(DZMRMTopView.clickComment(button:)), for: .touchUpInside)
        addSubview(comment)
        // 书签
        mark = UIButton(type:.custom)
        mark.contentMode = .center
        mark.setImage(UIImage(named:"RM_17"), for: .normal)
        mark.setImage(UIImage(named:"RM_18"), for: .selected)
        mark.addTarget(self, action: #selector(DZMRMTopView.clickMark(button:)), for: .touchUpInside)
        addSubview(mark)
    }
    
    @objc private func clickMark(button:UIButton) {
        
        readMenu.delegate?.readMenuClickMarkButton?(readMenu: readMenu, button: button)
    }
    
    @objc private func clickSubscribe(button:UIButton) {
        readMenu.delegate?.readMenuClickSubscribeButton?(readMenu: readMenu, button: button)
    }
    
    @objc private func clickComment(button:UIButton) {
        readMenu.delegate?.readMenuClickCommentButton?(readMenu: readMenu, button: button)
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // 按钮宽
        let buttonW:CGFloat = 50
        
        // 返回按钮
        back.frame = CGRect(x: 0, y: StatusBarHeight, width: buttonW, height: height - StatusBarHeight)
        
        //订阅
        subscribe.frame = CGRect(x: width - 3*buttonW-20, y: StatusBarHeight, width: buttonW, height: height - StatusBarHeight)
        //评论
        comment.frame = CGRect(x: width - 2*buttonW-10, y: StatusBarHeight, width: buttonW, height: height - StatusBarHeight)
        // 书签按钮
        mark.frame = CGRect(x: width - buttonW, y: StatusBarHeight, width: buttonW, height: height - StatusBarHeight)
    }
}
