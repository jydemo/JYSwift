//
//  JYHomeViewController.swift
//  JYNews
//
//  Created by atom on 16/10/23.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYHomeViewController: UIViewController {
    
    var oldIndex: Int = 0
    
    var homeTitles = [JYHomeTopTitle]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        setUI()
    
    }
    
    private func setUI() {
        
        view.backgroundColor = JYGlobalColor()
        
        automaticallyAdjustsScrollViewInsets = false
        
        navigationController?.navigationBar.barStyle = .Black
        
        navigationController?.navigationBar.barTintColor = JYColor(210, g: 63, b: 66, a: 1.0)
        
        navigationItem.titleView = titleView
        
       view.addSubview(scrollView)
    
    }
    
    private lazy var titleView: JYScrollTitleView = {
        
        let titleView = JYScrollTitleView()
        
        return titleView
    
    }()
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        
        scrollView.frame = UIScreen.mainScreen().bounds
        
        scrollView.pagingEnabled = true
        
        scrollView.delegate = self
        
        return scrollView
    
    }()
    
    //private lazy var tipView:
    
    private func showRefreshTipView() {
        
        JYNetworkTool.shareNetworkTool.loadarticleRefreshTip { [unowned self] (count) in
            
            //self.
            
        }
    
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

extension JYHomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
