//
//  PullView.swift
//  JYRefresingControl
//
//  Created by atom on 16/10/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class PullView: UIView {
    
    @IBOutlet weak var remindLabel: UILabel!
    
    @IBOutlet weak var lineImage: UIImageView!
    
    @IBOutlet weak var lineXConstraion: NSLayoutConstraint!
    
    @IBOutlet weak var topHeightConstraion: NSLayoutConstraint!
    
    @IBOutlet weak var buttonHeightConstraion: NSLayoutConstraint!
    
    func viewDisScroll(labelText: String!, labelColor: UIColor, alpha: CGFloat, hidden: Bool) {
        
        remindLabel.hidden = hidden
        
        remindLabel.text = labelText
        
        remindLabel.textColor = labelColor
        
        remindLabel.alpha = alpha
    
    }
    
    func lineAnimation() {
        
        lineXConstraion.constant = self.bounds.width
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { 
            self.layoutIfNeeded()
            }, completion: nil)
    
    }
    
    func initLine() {
        
        lineXConstraion.constant -= lineImage.bounds.width
    
    }
    
    func hiddView() {
        
        self.hidden = true
        
        remindLabel.hidden = true
        
        remindLabel.alpha = 0
        
        topHeightConstraion.constant = 0
    
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
