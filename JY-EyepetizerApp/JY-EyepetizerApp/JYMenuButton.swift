//
//  JYMenuButton.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/18.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

public enum JYMenubuttonType {

    case None
    
    case Date
}

class JYMenuButton: UIButton {
    
    private var type: JYMenubuttonType = .None
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        self.setImage(UIImage(named: "ic_action_menu"), forState: .Normal)
        
    }
    
    convenience init(frame: CGRect, type: JYMenubuttonType) {
        
        self.init(frame: frame)
        
        self.type = type
        
        if type == .Date {
        
            self.setTitle("Today", forState: .Normal)
        }
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        if type == .Date {
            
            return CGRect(x: self.height - UIConstant.UI_MARGIN_10, y: 0 , width: self.width - self.height + UIConstant.UI_MARGIN_10, height: self.height)
            
        }
        
        return CGRectZero
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: self.height, height: self.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
