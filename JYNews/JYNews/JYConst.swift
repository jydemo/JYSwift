//
//  JYConst.swift
//  JYNews
//
//  Created by atom on 16/10/23.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

/// 服务器地址
let BASE_URL = "http://lf.snssdk.com/"

let homeTopicCellID = "homeTopicCell"

/// 替换成自己的，再进行测试
let IID: String = "5034850950"

let device_id: String = "6096495334"

let JMargin: CGFloat = 10.0

let SCREENW = UIScreen.mainScreen().bounds.size.width

let SCREENH = UIScreen.mainScreen().bounds.size.height

func JYGlobalColor() -> UIColor {
    
    return JYColor(245, g: 245, b: 245, a: 1)
}

/// tabBar 被点击的通知
let JYTabBarDidSelectedNotification = "JYTabBarDidSelectedNotification"

func JYColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)

}