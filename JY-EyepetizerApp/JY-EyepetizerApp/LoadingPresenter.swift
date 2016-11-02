//
//  LoadingPresenter.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

protocol LoadingPresenter: class {
    
    var loaderview: JYLoaderview! { get set}
    
    
    
}

extension LoadingPresenter where Self: UIViewController {
    
    func setupLoaderview() {
    
        if loaderview == nil {
        
            loaderview = JYLoaderview(frame: CGRect(x: 0, y: 0, width: UIConstant.SCREEN_WIDTH, height: 100))
            
            loaderview.center = CGPoint(x: UIConstant.SCREEN_WIDTH * 0.5, y: UIConstant.SCREEN_HEIGHT * 0.4)
            
            self.view.addSubview(loaderview)
            
        }
    }
        
    func setLoaderViewHidden(hidden: Bool){
        
        if let view = loaderview {
            
            view.hidden = hidden
            
            if hidden {
                
                view.stopLoadingAnimation()
            
            } else {
            
                view.startLoadingAnimation()
            }
        }
    }
    
    func startLoadinganimation() {
    
        if let view = loaderview {
        
            view.startLoadingAnimation()
        }
    }
        
    func stopLoadinganimation() {
    
        if let view = loaderview {
            
            view.stopLoadingAnimation()
        
        }
    }
}

protocol MenuPresenter: class{
    var menuButton: JYMenuButton! { get set}
    
    func menuButtonClick()
}

extension MenuPresenter where Self: UIViewController {

    func setupMenuButton(type: JYMenubuttonType = .None) {
    
        menuButton = JYMenuButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), type: type)
        
        //menuButton.addTarget(self, action: #selector(menuButtonClick), forControlEvents: .TouchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        
    }
}
