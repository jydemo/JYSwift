//
//  JYLaunchview.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/12.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYLaunchview: UIView {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var blackBgView: UIView!
    
    
    
    typealias AnimationDisStopCallBack = (launchView: JYLaunchview) -> Void
    
    var callBack: AnimationDisStopCallBack?
    
    class func launchview() -> JYLaunchview {
        
        return NSBundle.mainBundle().loadNibNamed("JYLaunchview", owner: nil, options: nil).first as! JYLaunchview
    
    }
    
    func animationDidStop(callBack: AnimationDisStopCallBack?) {
        
        self.callBack = callBack
    
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        startAnimation()
    }
    
    private func startAnimation() {
    
        UIView.animateWithDuration(5, delay: 1, options: .CurveEaseOut, animations: { 
            
                self.imageView.transform = CGAffineTransformMakeScale(1.5, 1.5)
            
                self.blackBgView.alpha = 0
            
            
            }) { [unowned self ](_) in
                
                self.blackBgView.removeFromSuperview()
                
                if let cb = self.callBack {
                    
                    cb(launchView: self)
                
                }
        }
    
    }
}
