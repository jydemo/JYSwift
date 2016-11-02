//
//  JYNetworkTool.swift
//  JYNews
//
//  Created by atom on 16/10/23.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import Alamofire

import SVProgressHUD

import SwiftyJSON

import MJRefresh

class JYNetworkTool: NSObject {
    
    static let shareNetworkTool = JYNetworkTool()
    
    func loadarticleRefreshTip(finished: (count: Int) -> ()) {
        
        let url = BASE_URL + "2/article/v39/refresh_tip/"
        
        Alamofire.request(.GET, url).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                
                SVProgressHUD.showErrorWithStatus("加载失败。。")
                
                return
            
            }
            
            if let value = response.result.value {
            
                let json = JSON(value)
                
                let data = json["data"].dictionary
                
                let count = data!["count"]!.int
                
                finished(count: count!)
            }
            
            
        }
        
    }
    
    func loadHomeTitlesData(finished: (topTitles: [JYHomeTopTitle]) -> ()) {
    
        let url = BASE_URL + "article/category/get_subscribed/v1/?"
        
        let params = ["device_id": device_id, "aid": 13, "iid": IID]
        
        Alamofire.request(.GET, url, parameters: params as? [String: AnyObject]).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                
                SVProgressHUD.showErrorWithStatus("加载失败...")
                return
            }
            
            if let value = response.result.value {
            
                let json =  JSON(value)
                
                let dataDict = json["data"].dictionary
                
                if let data = dataDict!["data"]!.arrayObject {
                    
                    var topics = [JYHomeTopTitle]()
                    
                    for dict in data {
                        
                        let title = JYHomeTopTitle(dict: dict as! [String: AnyObject])
                        
                        print("title: \(title)")
                        
                        topics.append(title)
                    
                    }
                    
                    finished(topTitles: topics)
                }
            }
            
        }
        
        
    
    }
    
}
