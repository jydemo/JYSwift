//
//  HomeCell.swift
//  JYHTMLSimpleProject
//
//  Created by atom on 16/9/20.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    var model: [HomeJSONModel]? {
        
        didSet {
            
            //avatarView.image = UIImage(named: "default_img")
            
            categoryLabel.text = "category"
            
            timeLabel.text = "2016.09.20 21:00"
            
            summaryLabel.text = "summary"
        
        }
    
    }

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
