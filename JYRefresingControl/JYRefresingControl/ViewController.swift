//
//  ViewController.swift
//  JYRefresingControl
//
//  Created by atom on 16/10/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pullTopView: PullView!
    @IBOutlet weak var pullDownView: PullView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topHeightConstraion: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var shouldRemind = false

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offSety = scrollView.contentOffset.y
        
        let absY = abs(offSety)
        
        if offSety < -30 {
            
            pullDownView.lineAnimation()
            
            pullDownView.topHeightConstraion.constant = absY
            
            pullDownView.hidden = false
            
            if offSety <= -60 && offSety > -100 {
                
                shouldRemind = false
                
                let alpha = 0.04 * (abs(offSety) - 60)
                
                pullDownView.viewDisScroll("↓下拉设置通知", labelColor: UIColor.whiteColor(), alpha: alpha, hidden: false)
                
                animationWithColor(pullDownView, color: view.tintColor)
                
                if offSety < -85 {
                    
                    shouldRemind = true
                    
                    let remindString = "释放更换通知时间"
                    
                    pullDownView.viewDisScroll(remindString,
                                               labelColor: UIColor.whiteColor(),
                                               alpha: 1, hidden: false)
                
                }
            
            }
            
            
            
        } else if offSety > 200 {
            
            pullTopView.buttonHeightConstraion.constant = offSety - 190
        
        }
        
    }

}

