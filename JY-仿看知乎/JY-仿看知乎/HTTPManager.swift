//
//  HTTPManager.swift
//  JY-仿看知乎
//
//  Created by atom on 16/5/31.
//  Copyright © 2016年 cyin. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    
    case POST = "POST"
    
    case PUT = "PUT"
    
    case DELETE = "DELETE"
}

typealias CompletionHandler = (data: NSData?) -> ()

func getDataFromURL(urlString: String, method: HTTPMethod, parameter: [String: AnyObject]?, completionHandler: CompletionHandler) -> NSURLSessionDataTask? {
    
    guard let url = NSURL(string: urlString) else {
        
        print("URL error: \(urlString)")
        
        return nil
    
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
                
                print(e)
                
                return
            
            }
            
            completionHandler(data: data)
        })
    }
    
    task.resume()
    
    return task

}
