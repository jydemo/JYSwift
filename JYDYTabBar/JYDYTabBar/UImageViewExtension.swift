//
//  UImageViewExtension.swift
//  JYDYTabBar
//
//  Created by atom on 16/5/9.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

extension UIImage {
    
    func cicleImage() -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        
        let conref = UIGraphicsGetCurrentContext()
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        CGContextAddEllipseInRect(conref, rect)
        
        CGContextClip(conref)
        
        self.drawInRect(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
        
    }

}
