//
//  UIView+Extension.swift
//  JYNews
//
//  Created by atom on 16/10/23.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

extension  UIView {
    
    

    var width: CGFloat {
        
        get {
        
            return  frame.size.width
        }
        
        set(newValue) {
        
            var tempFrame: CGRect = frame
            
            tempFrame.size.width = newValue
            
            frame = tempFrame
        }
    
    }
    
    var height: CGFloat {
        
        get {
            
            return frame.size.height
        }
        
        set(newValue) {
            
            var tempFrame:CGRect = frame
            
            tempFrame.size.height = newValue
            
            frame = tempFrame
        
        }
    
    }
    
    var centerX: CGFloat {
        
        get {
        
            return center.x
        }
        
        set(newValue) {
            
            var tempCenter: CGPoint = center
            
            tempCenter.x = newValue
            
            center = tempCenter
        
        }
    
    }

}
