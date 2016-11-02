//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Media {
    
    case Book(title: String, author: String
        , year: Int)
    
    case Movie(title: String, author: String
        , year: Int)

}

let book = Media.Book(title: "sea", author: "may", year: 1860)

extension Media {
    
    func checkAuthor(author: String) -> Bool {
        
        switch self {
        case .Book(title: _, author: author, year: _):
            return true
            
        case .Movie(title: _, author: author, year: _):
            
            return true
        default:
            return false
        }
    
    }
    
    var isform: Bool {
        
        switch self {
        case .Book(title: _, author: "jules", year: _):
            return false
            
        case .Movie(title: _, author: "may", year: _):
            
            return true
            
        default:
            return false
        }
    
    }
    
    var mediaTitle: String {
        
        switch self {
            
        /*case .Book(title: let atitle, author: _, year: _):
            return atitle*/
            
        case let .Book(title: aTitle, author: _, year: _):
            
            return aTitle
            
        case let .Movie(title: aTitle, author: _, year: _):
            
            return aTitle
        }
        
        
    }

}

book.checkAuthor("jay")

book.isform

book.mediaTitle
