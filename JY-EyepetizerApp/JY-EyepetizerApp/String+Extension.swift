//
//  String+Extension.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import Foundation

extension String {
    
    var length: Int {
        
        return characters.count
    
    }

}

extension Int {
    
    static func durationToTimer(duration: Int) -> String {
        
        return "\(String(format: "%02d", duration/60))' \(String(format: "%02d", duration%60))\""
    
    }

}
