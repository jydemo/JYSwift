//
//  JYLoaderview.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/18.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYLoaderview: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(jyBackgroundLoaderView)
        
        self.addSubview(jyCenterLoaderView)
        
    }
    
    
    func startLoadingAnimation(){
        
        self.hidden = false
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        animation.fromValue = 0
        
        animation.toValue = M_PI * 2
        
        animation.duration = 2
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        animation.repeatCount = HUGE
        
        animation.fillMode = kCAFillModeForwards
        
        animation.removedOnCompletion = false
        
        self.jyCenterLoaderView.layer.addAnimation(animation, forKey: animation.keyPath)
    
    }
    
    
    func stopLoadingAnimation() {
        
        self.jyCenterLoaderView.layer.removeAllAnimations()
    
    }
    
    
    
    
    
    
    
    
    private lazy var jyBackgroundLoaderView: UIImageView = {
        
        let backgroundLoaderview = UIImageView(image: UIImage(named: "ic_eye_black_outer"))
        
        backgroundLoaderview.frame = CGRect(x: 0, y: 0, width: self.height, height: self.height)
        
        backgroundLoaderview.center = self.center
        
        backgroundLoaderview.contentMode = .ScaleAspectFit
        
        backgroundLoaderview.layer.allowsEdgeAntialiasing = true
        
        return backgroundLoaderview
    
    }()
    
    
    private lazy var jyCenterLoaderView: UIImageView = {
        
        let centerLoaderView = UIImageView(image: UIImage(named: "ic_eye_black_inner"))
        
        centerLoaderView.frame = CGRect(x: 0, y: 0, width: self.height - UIConstant.UI_MARGIN_5, height: self.height - UIConstant.UI_MARGIN_5)
        
        centerLoaderView.center = self.center
        
        centerLoaderView.contentMode = .ScaleAspectFit
        
        centerLoaderView.layer.allowsEdgeAntialiasing = true
        
        return centerLoaderView
    
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
