//
//  JYCell.swift
//  JYMVVM--开发者头条
//
//  Created by atom on 16/5/8.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import SnapKit

class JYCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUIS()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupUIS() {
        
        self.contentView.addSubview(proImageView)
        
        self.contentView.addSubview(nameLabel)
        
        self.contentView.addSubview(contentLabel)
        
        proImageView.snp_makeConstraints { (make) in
            //make.edges.equalTo(self.contentView).inset(UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
            
            make.topMargin.equalTo(10.0)
            
            make.leftMargin.equalTo(10.0)
            
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        nameLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(proImageView.snp_right).offset(10.0)
        
            make.top.equalTo(proImageView.snp_top).offset(-5.0)
            
        }
        
        contentLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(proImageView.snp_bottom).offset(10.0)
            
            make.left.equalTo(proImageView.snp_right).offset(10.0)
            
        }
    
    }
    
    private lazy var proImageView: UIImageView = {
        
        let image = UIImageView()
        
        image.backgroundColor = UIColor.redColor()
        
        return image
    
    }()
    
    private lazy var nameLabel: UILabel = {
    
        let label = UILabel()
        
        label.text = "label"
        
        label.textColor = UIColor.blueColor()
        
        label.font = UIFont.systemFontOfSize(15)
        
        return label
    
    }()
    
    private lazy var contentLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "有趣的Autolayout示例2-Masonry实现"
        
        return label
    
    
    }()

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
