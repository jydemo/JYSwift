//
//  ViewController.swift
//  JYVFLProject
//
//  Created by atom on 16/5/11.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let blueView = UIView()
        
        let greenView = UIView()
        
        greenView.backgroundColor = UIColor.greenColor()
        
        blueView.backgroundColor = UIColor.blueColor()
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(blueView)
        
        self.view.addSubview(greenView)
        
        let views = ["blue": blueView, "green": greenView]
        
        let vfl01 = "H:|-20-[green]-[blue(==green)]-|"
        
        let vfl02 = "V:|-40-[green(100)]-20-[blue(==green)]-200-|"
        
        let constraints01 = NSLayoutConstraint.constraintsWithVisualFormat(vfl01, options: [], metrics: nil, views: views)
        
        let cons02 = NSLayoutConstraint.constraintsWithVisualFormat(vfl02, options: [], metrics: nil, views: views)
        
        let cons = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: greenView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 20)
        
        
        self.view.addConstraints(constraints01)
        
        self.view.addConstraints(cons02)
        
        self.view.addConstraint(cons)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

