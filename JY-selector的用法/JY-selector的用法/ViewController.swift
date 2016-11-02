//
//  ViewController.swift
//  JY-selector的用法
//
//  Created by atom on 16/6/11.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var theButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //let jyButton = UIButton()
    
    //jyButton.addTarget(self, action: .buttonTapped, forControlEvents: .TouchUpInside)

    func buttTappp(sender: UIButton) {
        
    }
    
    
    private lazy var jyButton = {
        
        let button = UIButton()
        
        button.addTarget(self, action: Selector.buttonTapped, forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
        
    
    }()
    
    
    
}

private extension Selector {
    
    static let buttonTapped = #selector(ViewController.buttTappp(_:))

}

