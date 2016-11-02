//
//  JYChoiceCellCollectionViewCell.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/12.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYChoiceCell: UICollectionViewCell, Reusable {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(backgroundImageview)
        
        self.contentView.addSubview(titleLabel)
        
        self.contentView.addSubview(subTitleLabel)
        
        backgroundImageview.snp_makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(self.contentView)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.leading.trailing.equalTo(self.contentView)
            
            make.height.equalTo(20)
            
            make.centerY.equalTo(self.contentView.center).offset(-10)
        }
        
        subTitleLabel.snp_makeConstraints { (make) in
            make.leading.trailing.equalTo(self.contentView)
            
            make.height.equalTo(20)
            
            make.centerY.equalTo(self.contentView.center).offset(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: ItemModel! {
        
        didSet {
            
            if let feed = model.feed {
                
                self.backgroundImageview.yy_setImageWithURL(NSURL(string: feed)!, options: .ProgressiveBlur)
            
            } else {
            
                if let image = model.image {
                    
                    self.backgroundImageview.yy_setImageWithURL(NSURL(string: image)!, options: .ProgressiveBlur)
                    
                    self.subTitleLabel.hidden = true
                    
                }
            }
            
            self.titleLabel.text = model.title
            
            self.subTitleLabel.text = model.subTitle
        
        }
    
    }
    
    private lazy var titleLabel: UILabel = {
        
        var titleLabel: UILabel = UILabel()
        
        titleLabel.textAlignment = .Center
        
        titleLabel.text = "标题"
        
        //titleLabel.font = UIFont.customFont_FZLTZCHJW(fontSize: UIConstant.UI_FONT_14)
        
        return titleLabel
    
    }()
    
    private lazy var subTitleLabel: UILabel = {
    
        var subTitleLabel: UILabel = UILabel()
        
        subTitleLabel.textAlignment = .Center
        
        subTitleLabel.text = "副标题"
        
        subTitleLabel.textColor = UIColor.whiteColor()
        
        //subTitleLabel.font = UIFont.customFont_FZLTZCHJW()
        
        return subTitleLabel
    
    }()
    
    private lazy var backgroundImageview: UIImageView = {
        
        var background: UIImageView = UIImageView()
        
        return background
        
        
    
    }()
}
