//
//  JSONModelMapper.swift
//  JY-仿看知乎
//
//  Created by atom on 16/5/31.
//  Copyright © 2016年 cyin. All rights reserved.
//

import Foundation

extension NSData {
    
    func convertToModel<T: NSObject>() -> T? {
        
        do {
            
            let json = try NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.MutableContainers)
            
            let model = json => T.self
            
            return model
        
        
        } catch {
        
            print("JSONSerializationError: \(error)")
            return nil
            
        }
    
    }

}

extension Dictionary {
    
    func convertToModel<T: NSObject>() -> T {
        
        let model = T()
        
        let mirror = Mirror(reflecting: model)
        
        mirror.children.forEach {
            
            guard let key = $0.label else { return }
            
            var value: Value!
            
            if self[key as! Key] == nil {
                
                switch key {
                    
                    case "userHash":
                    
                    value = self["hash" as! Key]
                    
                default:
                    
                    return
                
                }
            
            } else {
            
                value = self[key as! Key]
                
            
            }
            
            model.setValue(value as? AnyObject, forKey: key)
        }
        
        return model
    
    }

}

func =><T: NSObject>(lhs: NSData, rhs: T.Type) -> T? {
    
    let model: T? = lhs.convertToModel()
    
    return model

}

func =><T: NSObject>(lhs: AnyObject, rhs: T.Type) -> T? {
    
    guard let dict = lhs as? [String: AnyObject] else {
        
        print("Can't convert \(lhs) to [String: AnyObject].")
        return nil

    }
    
    let model: T = dict.
    
    return model

}