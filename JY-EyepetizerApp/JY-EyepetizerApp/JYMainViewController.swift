//
//  JYMainViewController.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/12.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        delegate = self
        
        tabBar.addSubview(tabView)
        
        addChildVC()
        
        view.addSubview(launchView)
        
        launchView.animationDidStop { [unowned self](launchView) in
            
            self.launchViewRemoveAnimation()
            
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        for button in self.tabBar.subviews {
            
            if button is UIControl {
            
                button.removeFromSuperview()
            }
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildVC() {
        
        let choiceController = JYChoiceViewController()
        
        let discoverController = JYDiscoverViewController()
        
        let popularController = JYPopularViewController()
        
        setupChildcontroller(choiceController)
        
        setupChildcontroller(discoverController)
        
        setupChildcontroller(popularController)
    
    }
    
    private func setupChildcontroller(vc: UIViewController) {
        
        vc.title = "JYpetizer"
        
        self.addChildViewController(JYNavgationController(rootViewController: vc))
        
        self.view.bringSubviewToFront(vc.view)
    
    }
    
    private func launchViewRemoveAnimation() {
        
        UIView.animateWithDuration(1, animations: {
            
            self.launchView.alpha = 0
        
        }) { [unowned self](_) in
            
            
            self.launchView.removeFromSuperview()
            
        
        }
    
    }
    
    private lazy var tabView: JYMainTabview = {
    
        var tabView: JYMainTabview = JYMainTabview.tabView()
        
        tabView.frame = self.tabBar.bounds
        
        tabView.delegate = self
        
        return tabView
    
    }()
    
    
    private lazy var launchView: JYLaunchview = {
    
        var launchView: JYLaunchview = JYLaunchview.launchview()
        
        launchView.frame = self.view.bounds
        
        return launchView
    
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JYMainViewController: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return JYTabBarTransition()
    }

}

extension JYMainViewController: JYMainTabviewDelegate {

    func tabBarDidSelector(fromSelectorbutton from: Int, toSelectorButton to: Int, title: String) {
        
        print("tabBarDidSelector")
        
        self.selectedIndex = to
    }

}
