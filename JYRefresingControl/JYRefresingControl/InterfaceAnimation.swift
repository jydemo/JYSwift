//
//  InterfaceAnimation.swift
//  JYRefresingControl
//
//  Created by atom on 16/10/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

func animationWithColor(superView: UIView,color: UIColor){
    UIView.transitionWithView(superView, duration: 1.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
        superView.backgroundColor = color
        }, completion: nil)
}
