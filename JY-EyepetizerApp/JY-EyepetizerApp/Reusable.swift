//
//  Reusable.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

public protocol Reusable: class {
    
    static var reuseID: String { get }

}


extension Reusable {
    
    static var reuseID: String {
        
        return String(Self)
    
    }

}

public extension UICollectionView {
    
    func registerClass<T: UICollectionView where T: Reusable>(cellClass: T.Type) {
    
        self.registerClass(T.self, forCellWithReuseIdentifier: T.reuseID)
    
    }

}