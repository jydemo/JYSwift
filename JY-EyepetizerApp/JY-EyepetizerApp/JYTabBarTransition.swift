//
//  JYTabBarTransition.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/12.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYTabBarTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: NSTimeInterval = 0.4
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView: UIView = transitionContext.containerView()!
        
        let fromeView = transitionContext.viewControllerForKey(UITransitionContextFromViewKey)?.view
        
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)?.view
        
        containerView.addSubview(toView!)
        
        toView?.alpha = 0
        
        fromeView?.alpha = 1
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            toView?.alpha = 1
            
            fromeView?.alpha = 0
            
        }) { (_) -> Void in
        
            transitionContext.completeTransition(true)
        }
        
        
    
    }
    
    
}
