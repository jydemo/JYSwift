//
//  LastComments.swift
//  JYDYTabBar
//
//  Created by atom on 16/5/5.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class LastComments: NSObject {
    
   // {
    
    var content: String? //= "\U7a7f\U82cf\U83f2\U7684\U597d\Uff0c\U5e7f\U544a\U4e0a\U8bf4\U5438\U6c34\U7279\U5f3a!";
    var ctime: String? //= "2016-05-05 09:21:37";
    var data_id: String? //= 18362009;
    var id: String? //= 50768750;
    var like_count: String? //= 3;
    //precid //= 0;
    //precmt //=             (
    //);
    //preuid //= 0;
    //status //= 0;
    //voicetime = 0;
//voiceuri = "";
//}
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.content = dict["content"] as? String
        
        self.ctime = dict["ctime"] as? String
        
        self.data_id = dict["data_id"] as? String
        
        self.id = dict["id"] as? String
        
        self.like_count = dict["like_count"] as? String
        
    }
    
    class func mode2Object(dict: [[String: AnyObject]]) -> [LastComments] {
        
        var models =  [LastComments]()
        
        for model in dict {
        
        
            models.append(LastComments(dict: model))
            
        }
        
        return models
    
    }

}
