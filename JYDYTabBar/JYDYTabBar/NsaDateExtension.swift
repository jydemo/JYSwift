//
//  NsaDateExtension.swift
//  JYDYTabBar
//
//  Created by atom on 16/4/28.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

extension NSDate {
    
    
    class func sinaDate(time: String?) -> NSDate? {
    
        let formatter = NSDateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //"EEE MMM d HH:mm:ss Z yyyy"
        
        formatter.locale = NSLocale(localeIdentifier: "en")
        
        if let time = time {
            
            return formatter.dateFromString(time)
        
        }
        
        return NSDate()
    
    }
    
    var dateDesctiption: String {
    
        let cal = NSCalendar.currentCalendar()
        
        if cal.isDateInToday(self) {
            
            let delta = Int(NSDate().timeIntervalSinceDate(self))//NSDate.timeIntervalSinceDate(self)
            
            
            if delta < 60 {
            
                return "刚刚"
            }
            
            if delta < 60 * 60 {
                
                return "\(delta/60)分钟前"
            
            }
            
            return "\(delta / 3600)小时前"
        
        }
        
        var fmtString = "HH:mm"
        
        if cal.isDateInYesterday(self) {
        
            fmtString = "昨天" + fmtString
        
        } else {
        
            fmtString = "MM-dd" + fmtString
            
            let coms = cal.components(NSCalendarUnit.Year, fromDate: self, toDate: NSDate(), options: NSCalendarOptions(rawValue: 0))
            
            if coms.year > 0 {
            
                fmtString = "yyyy-" + fmtString
            }
        
        }
        
        let df = NSDateFormatter()
        
        df.dateFormat = fmtString
        
        df.locale = NSLocale(localeIdentifier: "en")
        
        //df.dateFromString(fmtString)
        
        return df.stringFromDate(self)
    }



}
