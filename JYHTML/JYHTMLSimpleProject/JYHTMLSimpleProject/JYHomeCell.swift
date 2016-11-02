//
//  JYHomeCell.swift
//  JYHTMLSimpleProject
//
//  Created by atom on 16/9/18.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYHomeCell: UITableViewCell {

    var status: Status? {
    
        didSet {
            
            if let status = status {
                
                statusLabel.text = status.text
                
                print(status.stordPictureURLs?.count)
                
                pictrueView.pictureURLs = status.stordPictureURLs
                
            
                
                //pictrueView.heightConstraint.constant = Status.calPictrueViewSize(status.stordPictureURLs?.count).height
                
                if let user = status.user {
                    
                    nameLabel.text = user.name
                }
                
            }
        
        }

    }
    @IBOutlet weak var iconImage: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var pictrueView: JYPictrueView!
    @IBOutlet weak var pictrueTop: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
