//
//  JYCollectionView.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/14.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

class JYCollectionLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        let itemheight = 200 * UIConstant.SCREEN_WIDTH / UIConstant.IPHONE5_WIDTH
        
        itemSize = CGSize(width: UIConstant.SCREEN_WIDTH, height: itemheight)
        
        sectionInset = UIEdgeInsetsZero
        
        minimumInteritemSpacing = 0
        
        minimumLineSpacing = 0
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

class JYCollectionView: UICollectionView {
    
    
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = UIColor.whiteColor()
        
        registerClass(JYChoiceCell.self, forCellWithReuseIdentifier: JYChoiceCell.reuseID)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
