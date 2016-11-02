//
//  GrandModel.swift
//  JY- 打造强大的BaseModel库
//
//  Created by atom on 16/6/1.
//  Copyright © 2016年 cyin. All rights reserved.
//

import Foundation

protocol MapAble{
    static func mapModel(obj:AnyObject)->Self  //将一个字典转化成自己
}


class GrandModel: NSObject {
    
    class var selfMapDescription: [String: String]? {
        
        return nil
        
    }
    
    required override init() {
        
        super.init()
        
    }
    
}

extension GrandModel: MapAble {
    
    static func mapModel(obj: AnyObject) -> Self {
        
        let model = self.init()
        
        if let mapTable = self.selfMapDescription{
            
            if let dict = obj as? [String: AnyObject] {
                
                for item in dict {
                    
                    if let key = mapTable[item.0] {
                        
                        print("\(key)")
                        
                        model.setValue(item.1, forKey: key)
                    }
                    
                }
                
            }
            
        }
        
        return model
    }
    
}