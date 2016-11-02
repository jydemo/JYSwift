//
//  Constant.swift
//  JY-仿看知乎
//
//  Created by atom on 16/5/31.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

struct API {
    
    static let APIHost = "http://api.kanzhihu.com/"
    static let ArticleHost = "http://www.zhihu.com"
    static let ZhuanlanHost = "http://zhuanlan.zhihu.com"
    
    static let Home = APIHost + "getposts"
    
    static let AnswerList = APIHost + "getpostanswers/"
    
    static let Article = ArticleHost + "/question/"
    
    static let TopUserAPI = APIHost + "topuser/"
    static let TopUserOrderByAgreeNum = TopUserAPI + "agree/"
    
    static let UserDetail = APIHost + "userdetail2/"
    
    static let SearchUser = APIHost + "searchuser/"
}
