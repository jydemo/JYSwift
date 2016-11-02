//
//  Response.swift
//  JYMVVM--开发者头条
//
//  Created by atom on 16/5/8.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit



class Response: NSObject {
    
    var data: AnyObject?
    
    var msg: String?
    
    init(dict: [String: AnyObject]) {
        
        self.data = dict["data"]
        
        self.msg = dict["msg"] as? String
        
    }
    
    
    

}
