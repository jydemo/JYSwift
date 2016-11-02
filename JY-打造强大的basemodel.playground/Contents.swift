//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class democlass{

    var demoID: Int = 0
    
    var demoName: String?

}

extension democlass: CustomStringConvertible {
    
    var description: String {
        
        return "DemoClass: demoId: demoName:"
    
    }

}

extension democlass: CustomDebugStringConvertible {
    
    var debugDescription: String {
    
        return self.description
    
    }

}

let demo1 = democlass()

print(demo1)

demo1.demoName = "this is a demo"

print(demo1)




protocol MapAble {
    
    static func mapModel(obj: AnyObject) -> Self
    
}






































