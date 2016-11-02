//
//  JYCellTableViewCell.swift
//  JY自定义cell
//
//  Created by atom on 16/5/6.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYCellTableViewCell: UITableViewCell {
    
    override var frame: CGRect {
        
        get {
            
            return super.frame
        
        }
        
        set {
            
            super.frame.origin.x = 30
            
            super.frame.size.width = super.frame.size.width - 60
        
        
            //super.frame = CGRect(x: 10, y: 10, width: 200, height: 100)
            
        }
    
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
