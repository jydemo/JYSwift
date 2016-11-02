//
//  JYTabBarController.swift
//  JYNews
//
//  Created by atom on 16/10/23.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildControllers()
    }
    
    override class func initialize() {
    
        let tabBar = UITabBar.appearance()
        
        tabBar.tintColor = JYColor(111, g: 111, b: 111, a: 1.0)
    }

    private func addChildControllers() {
        
        addChildViewController(JYHomeViewController(), title: "首页", imageName: "home_tabbar_22x22_", selectedImageName: "home_tabbar_press_22x22_")
        
        addChildViewController(JYVideoViewController(), title: "视频", imageName: "video_tabbar_22x22_", selectedImageName: "video_tabbar_press_22x22_")
        
        addChildViewController(JYNewCareViewController(), title: "视频", imageName: "video_tabbar_22x22_", selectedImageName: "video_tabbar_press_22x22_")
        
        addChildViewController(JYMineViewController(), title: "我的", imageName: "mine_tabbar_22x22_", selectedImageName: "mine_tabbar_press_22x22_")
    
    }
    

    private func addChildViewController(childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
    
        childController.tabBarItem.image = UIImage(named: imageName)
        
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        
        childController.title = title
        
        let nav = JYNavigationController(rootViewController: childController)
        
        addChildViewController(nav)
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
