//
//  NSDate+Extension.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import Foundation

extension NSDate {

    class func getCurrentTimeStamp() -> String {
        let timeStamp : String = "\(Int64(floor(NSDate().timeIntervalSince1970 * 1000)))"
        return timeStamp
    }

}
