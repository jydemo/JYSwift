//
//  main.swift
//  JY- 打造强大的BaseModel库
//
//  Created by atom on 16/6/1.
//  Copyright © 2016年 cyin. All rights reserved.
//

import Foundation

print("Hello, World!")


class DemoClass: GrandModel {
    
    var name : String?
    
     var age = 0
    
     var grade = 0
    
   override static var  selfMapDescription: [String: String]? {
    
        return ["sName": "name", "iAge": "age", "iGrade": "grade"]
    
    }

}

let demoDict = ["sName": "Stan", "iAge": "12", "iGrade": "6"]

var demo = DemoClass()

demo = DemoClass.mapModel(demoDict)

print(demo)

