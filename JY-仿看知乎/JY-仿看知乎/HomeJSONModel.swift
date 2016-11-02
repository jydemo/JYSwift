//
//  HomeJSONModel.swift
//  JY-仿看知乎
//
//  Created by atom on 16/5/31.
//  Copyright © 2016年 cyin. All rights reserved.
//

import Foundation


class HomeJSONModel: NSObject {
    
    var error = ""
    var count = 0
    //因为通过 Runtime 设置的值只能是 NSObject 的子类，如果定义[Post]的话，取元素的时候会报错（因为 NSArray 的元素是 AnyObject 类型，不会自动转化成 Post
    var posts = []
}