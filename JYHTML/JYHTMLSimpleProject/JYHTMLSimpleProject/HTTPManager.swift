//
//  HTTPManager.swift
//  JYHTMLSimpleProject
//
//  Created by atom on 16/9/19.
//  Copyright © 2016年 cyin. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    
   case POST = "POST"
    
    case PUT = "PUT"
    
    case DELETE = "DELETE"
}

typealias Completionhandler = (data: NSData?) -> ()

func getDataFormURL(urlString: String, method: HTTPMethod, parameter: [String: AnyObject]?, CompletionHandler: Completionhandler) -> NSURLSessionDataTask {
    
    guard let url = NSURL(string: urlString) else {
        
        return NSURLSessionDataTask()
    }
    
    let session = NSURLSession.sharedSession()
    
    let request = NSMutableURLRequest(URL: url)
    
    request.HTTPMethod = method.rawValue
    
    switch method {
    case .POST, .PUT:
        if let param = parameter {
            
            request.HTTPBody = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.init(rawValue: 0))
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    default:
        break
    }
    
    let task = session.dataTaskWithRequest(request) { (data, response, error) in
        
        dispatch_async(dispatch_get_main_queue(), { 
            if let e = error {
                
                return
            }
            
            CompletionHandler(data: data)
        })
        
    }
    
    task.resume()
    
    return task

}
