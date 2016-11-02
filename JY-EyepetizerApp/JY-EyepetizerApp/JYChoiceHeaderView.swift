//
//  JYChoiceHeaderviewCollectionReusableView.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import SnapKit

import YYWebImage

class JYChoiceHeaderView: UICollectionReusableView, Reusable {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
        self.addSubview(titleLabel)
        
        self.addSubview(imageView)
        
        titleLabel.snp_makeConstraints { [unowned self ] (make) in
            
            make.edges.equalTo(self)
            
        }
        
        imageView.snp_makeConstraints { [unowned self](make) in
            
            make.leading.trailing.equalTo(self)
            
            make.top.equalTo(self).offset(self.height * 0.25)
            
            make.height.equalTo(self.height * 0.5)
        }
        
        
    }
    
    var title: String? {
        
        didSet {
            
            if let _ = title {
                
                self.imageView.hidden = true
                
                self.titleLabel.hidden = false
                
                self.titleLabel.text = title!
            
            } else {
                
                self.imageView.hidden = false
                
                self.titleLabel.hidden = true
            
            }
        
        }
    
    }
    
    var image: String? {
        
        didSet {
            
            if let _ = image {
                
                self.titleLabel.hidden = true
                
                self.imageView.hidden = false
                
                self.imageView.yy_setImageWithURL(NSURL(string: image!)!, options: .ProgressiveBlur)
                
                //yy_setImageWithURL(NSURL(string: image!)!, options: .ProgressiveBlur)
                
            } else {
            
                self.titleLabel.hidden = false
                
                self.imageView.hidden = true
            
            }
        
        }
    
    }
    
    private lazy var titleLabel: UILabel = {
        
        var titleLabel: UILabel = UILabel()
        
        titleLabel.textAlignment = .Center
        
        titleLabel.font = UIFont.customFont_Lobster(fontSize: UIConstant.UI_FONT_16)
        
        return titleLabel
    
    }()
    
    private lazy var imageView: UIImageView = {
        
        var imageView: UIImageView = UIImageView()
        
        imageView.contentMode = .ScaleAspectFit
        
        return imageView
    
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
