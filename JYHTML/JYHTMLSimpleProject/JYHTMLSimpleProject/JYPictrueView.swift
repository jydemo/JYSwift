//
//  JYPictrueView.swift
//  JYHTMLSimpleProject
//
//  Created by atom on 16/9/18.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import Kingfisher

class JYPictrueView: UIView {
    
    var pictureURLs: [NSURL]? {
        
        didSet {
            
            for view in subviews {
                
                view.hidden = true
            
            }
            
            var index = 0
            
            for url in pictureURLs ?? [] {
                
                let imageView = subviews[index] as! UIImageView
                
                imageView.kf_setImageWithURL(url)
                
                imageView.hidden = false
                
                index += 1
            
            }
            
        
        }
    
    }

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        
        setUI()
        
    }

}

extension JYPictrueView {
    
    func setUI() {
        
        clipsToBounds = true
        
        let count = 3
        
        let rect = CGRect(x: 0, y: JYPictureViewOutterMargin, width: JYPictureViewItemWith, height: JYPictureViewItemWith)
        
        for i in 0..<count * count {
        
            let imageView = UIImageView()
            
            //imageView.backgroundColor = UIColor.redColor()
            
            imageView.contentMode = .ScaleAspectFit
            
            let row = CGFloat( i / 3)
            
            let col = CGFloat( i % 3)
            
            let xOffSet = col * (JYPictureViewItemWith + JYPictureViewInnerMargin)
            
            let yOffSet = row * (JYPictureViewItemWith + JYPictureViewInnerMargin)
            
            imageView.frame = rect.offsetBy(dx: xOffSet, dy: yOffSet)
            
            addSubview(imageView)
        }
    
    
    }


}
