//
//  JYMainTabview.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/12.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

protocol JYMainTabviewDelegate {
    
    func tabBarDidSelector(fromSelectorbutton from: Int, toSelectorButton to: Int, title: String)
    
}

class JYMainTabview: UIView {
    
    @IBOutlet weak var choiceButton: UIButton!
    
    @IBOutlet weak var discoverButton: UIButton!
    
    @IBOutlet weak var popularButton: UIButton!
    
    private weak var selectorButton: UIButton!
    
    var delegate: JYMainTabviewDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.bringSubviewToFront(choiceButton)
        
        self.bringSubviewToFront(discoverButton)
        
        self.bringSubviewToFront(popularButton)
        
        setupButtonFont(tabButton: choiceButton)
        
        setupButtonFont(tabButton: discoverButton)
        
        setupButtonFont(tabButton: popularButton)
        
        selectorButton = choiceButton
        
    }
    
    @IBAction func choicebtnclick(sender: UIButton) {
        
        print("choicebtnclick")
        
        setupSelectorButton(sender)
        
    }
    
    @IBAction func discoverBtnclick(sender: UIButton) {
        
        print("discoverBtnclick")
        
        setupSelectorButton(sender)
    }
    
    @IBAction func popularBtnClick(sender: UIButton) {
        
        print("popularBtnClick")
        
        setupSelectorButton(sender)
        
    }
    private func setupButtonFont(tabButton btn: UIButton) {
        
        //btn.titleLabel?.font = UIFont.customFont_FZLTXIHJW()
        
        btn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        
        btn.setTitleColor(UIColor.blackColor(), forState: [.Highlighted, .Selected])
        
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
        
    
    }
    
    private func setupSelectorButton(selectorBtn: UIButton) {
        
        guard selectorBtn != selectorButton else {
            
            return
        
        }
        
        selectorButton.selected = false
        
        selectorBtn.selected = true
        
        delegate?.tabBarDidSelector(fromSelectorbutton: selectorButton.tag, toSelectorButton: selectorBtn.tag, title: (selectorBtn.titleLabel?.text)!)
        
        selectorButton = selectorBtn
    
    }
    
    class func tabView() -> JYMainTabview {
        
        return NSBundle.mainBundle().loadNibNamed("JYMainTabView", owner: nil, options: nil).first as! JYMainTabview
    
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
