//
//  JYPageViewController.swift
//  JYPageViewControllerProject
//
//  Created by atom on 16/2/21.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - delegate
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        
    }
    
    func viewConotrollerAtIndex(index: Int) -> UIViewController {
    
        return nil
    
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
