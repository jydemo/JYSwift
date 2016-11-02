//
//  JYNavigationController.swift
//  JYNews
//
//  Created by atom on 16/10/23.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYNavigationController: UINavigationController {
    
    override class func initialize() {
    
        super.initialize()
        
        let navBar = UINavigationBar.appearance()
        
        navBar.barTintColor = UIColor.whiteColor()
        
        navBar.tintColor = JYColor(0, g: 0, b: 0, a: 0.7)
        
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
    
    
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_28x28_"), style: .Plain, target: self, action: #selector(navgationBack))
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func navgationBack() {
    
        popViewControllerAnimated(true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
