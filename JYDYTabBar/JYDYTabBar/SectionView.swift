//
//  SectionView.swift
//  JYDYTabBar
//
//  Created by atom on 16/5/6.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class SectionView: UITableViewHeaderFooterView {
    
    var labelTitle: String? {
    
        didSet{
            
            sectionLabel.text = labelTitle!
        
        }
    
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.redColor()
        setupUIs()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupUIs() {
        
        self.addSubview(sectionLabel)
        
        sectionLabel.frame.size.width = 200
        
        sectionLabel.frame.origin.x = 20
        
        sectionLabel.frame.origin.y = 15
        
        sectionLabel.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        
        //sectionLabel.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: self, size: CGSize(width: 200, height: 44), offset: CGPoint(x: 10, y: 0))
        
    }
    
    private lazy var sectionLabel: UILabel = {
        
        let seclabel = UILabel()
        
        seclabel.font = UIFont.systemFontOfSize(11)
        
        seclabel.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        
        return seclabel
        
        
    }()

}
