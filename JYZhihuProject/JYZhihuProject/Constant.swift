//
//  Constant.swift
//  JYZhihuProject
//
//  Created by atom on 16/2/28.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit


//主页上得各种高度的变量
/// 100
let TABLE_CELL_HEIGHT : Float = 100
/// 24
let SECTION_HEIGHT:Float = 24
/// 80
let SCROLL_HEIGHT:Float = 80
/// 400
let IMAGE_HEIGHT:Float = IN_WINDOW_HEIGHT+200
/// 200
let IN_WINDOW_HEIGHT:Float = UIScreen.mainScreen().bounds.height > 1000 ? 300 : 200
/// 44
let TITLE_HEIGHT:Float = 44

let FONT_SIZE:CGFloat = UIScreen.mainScreen().bounds.height > 1000 ? 20 : 16

//知乎的各种网址
/// http://news-at.zhihu.com/api/4/start-image/1080*1776
let LAUNCH_IMAGE_URL="http://news-at.zhihu.com/api/4/start-image/1080*1776"
let LATEST_NEWS_URL="http://news-at.zhihu.com/api/4/news/latest"
let SOMEDAY_NEWS_URL = "http://news.at.zhihu.com/api/4/news/before/"
let NEWS_DETAIL_URL = "http://news-at.zhihu.com/api/4/news/"
let NEWS_EXTRA_URL = "http://news-at.zhihu.com/api/4/story-extra/"
let COMMENTS_URL = "http://news-at.zhihu.com/api/4/story/"
let RECOMMENDERS_URL = "http://news-at.zhihu.com/api/4/story/"
let PEOPLE_URL = "http://www.zhihu.com/people/"
let THEME_URL = "http://news-at.zhihu.com/api/4/themes"