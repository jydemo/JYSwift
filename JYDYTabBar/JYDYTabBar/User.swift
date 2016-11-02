//
//  User.swift
//  JYDYTabBar
//
//  Created by atom on 16/5/5.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class User: NSObject {
    
    //user// =             {
    var id: String? //= 11592908;
    //"is_vip" = 0;
    var personal_page: String? //" = "http://user.qzone.qq.com/B50E0861F93B06DBC84EF9C22E9C095B";
    var profile_image: String? //" = "http://wimg.spriteapp.cn/profile/large/2016/05/01/57251e0a3be19_mini.jpg";
    //"qq_uid" = "";
    //"qzone_uid" = B50E0861F93B06DBC84EF9C22E9C095B;
    //sex = m;
    var username: String? //= "\U738b\U540e\U4ee4\U6211\U5e72\U6655\U5979";
    //"weibo_uid" = "";
    //};
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.personal_page = dict["personal_page"] as? String
        
        self.profile_image = dict["profile_image"] as? String
        
        self.username = dict["username"] as? String
        
        self.id = dict["id"] as? String
        
    }
    
    class func mode2Object(dict: [[String: AnyObject]]) -> [User] {
        
        var models =  [User]()
        
        for model in dict {
            
            
            models.append(User(dict: model))
            
        }
        
        return models
        
    }


}
