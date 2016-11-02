//
//  JYScrollTitleView.swift
//  JYNews
//
//  Created by atom on 16/10/23.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import Kingfisher

import SnapKit

class JYScrollTitleView: UIView {

    var titles = [JYHomeTopTitle]()
    
    var labeles = [JYTitleLabel]()
    
    private var labelWidths = [CGFloat]()
    
    var addBtnClickClosure: (() -> ())?
    
    var didSelectTitleLabel: ((titleLabel: JYTitleLabel) -> ())?
    
    var titleClossure: ((titleArray: [JYHomeTopTitle]) -> ())?
    
    private var currentIndex = 0
    
    private var oldIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        JYNetworkTool.shareNetworkTool.loadHomeTitlesData { [unowned self] (topTitles) in
            
            let dict = ["category": "__all__", "name": "推荐"]
            
            let recommend = JYHomeTopTitle(dict: dict)
            
            self.titles.append(recommend)
            
            self.titles += topTitles
            
            self.setUI()
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
    
        addSubview(scrollView)
        
        addSubview(addButton)
        
        scrollView.snp_makeConstraints { (make) in
            
            make.left.top.bottom.equalTo(self)
            
            make.right.equalTo(addButton.snp_left)
            
        }
        
        addButton.snp_makeConstraints { (make) in
            
            make.top.bottom.right.equalTo(self)

            make.width.equalTo(30)
        }
        
        setupTitlesLable()
        
        setupLabelPosittion()
        
        titleClossure?(titleArray: titles)
        
    }
    
    func didSelectTitleLabelClosure(closure: ((titleLabel: JYTitleLabel) -> ())) {
        
        didSelectTitleLabel = closure
    
    }
    
    func titleArrayClosure(closure:(titileArray: [JYHomeTopTitle]) -> ()) {
    
        titleClossure = closure
    }
    
    private  lazy var scrollView: UIScrollView = {
        
        let scrollview = UIScrollView()
        
        scrollview.showsHorizontalScrollIndicator = false
        
        return scrollview
        
    }()
    
    private lazy var addButton: UIButton = {
    
        let addButton = UIButton()
        
        addButton.setImage(UIImage(named: "add_channel_titlbar_16x16_"), forState: .Normal)
        
        addButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        addButton.addTarget(self, action: #selector(addButtonClick), forControlEvents: .TouchUpInside)
        
        return addButton
    }()
    
    func addButtonClick() {
    
        addBtnClickClosure?()
    }
    
    func addButtonClickClosure(closure: () -> ()) {
        
        addBtnClickClosure = closure
    
    }

}

extension JYScrollTitleView {
    
    private func setupTitlesLable() {
    
        for (index, topic) in titles.enumerate() {
        
            let label = JYTitleLabel()
            
            label.text = topic.name
            
            label.tag = index
            
            label.textColor = JYColor(235, g: 235, b: 235, a: 1.0)
            
            label.textAlignment = .Center
            
            label.userInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(titleLabelOnclick(_:)))
            
            label.addGestureRecognizer(tap)
            
            label.font = UIFont.systemFontOfSize(17)
            
            label.sizeToFit()
            
            label.width += JMargin
            
            labeles.append(label)
            
            labelWidths.append(label.width)
            
            scrollView.addSubview(label)
        }
        
        let currentLabel = labeles[currentIndex]
        
        currentLabel.textColor = UIColor.whiteColor()
        
        currentLabel.currentScale = 1.1
    }
    
    private func setupLabelPosittion() {
        
        var titleX: CGFloat = 0.0
        
        let titleY: CGFloat = 0.0
        
        var titleW: CGFloat = 0.0
        
        let titleH: CGFloat = self.height
        
        for (index, label) in labeles.enumerate() {
        
            titleW = labelWidths[index]
            
            titleX = JMargin
            
            if index != 0 {
            
                let lastLabel = labeles[index - 1]
                
                titleX = CGRectGetMaxX(lastLabel.frame) + JMargin
                
            }
            
            label.frame = CGRectMake(titleX, titleY, titleW, titleH)
        }
        
        if let lastLabel  = labeles.last {
            
            scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastLabel.frame), 0)
        
        }
    
    }
    
    func titleLabelOnclick(tap: UITapGestureRecognizer) {
    
        guard let currentLabel = tap.view as? JYTitleLabel else {
            
            return
            
        }
        
        oldIndex = currentIndex
        
        currentIndex = currentLabel.tag
        
        let oldLabel = labeles[oldIndex]
        
        oldLabel.textColor = JYColor(235, g: 235, b: 235, a: 1.0)
        
        oldLabel.currentScale = 1.0
        
        oldLabel.textColor = UIColor.whiteColor()
        
        currentLabel.currentScale = 1.1
        
        adjustTitleOffSetCurrentIndex(currentIndex, oldInfex: oldIndex)
        
        didSelectTitleLabel?(titleLabel: currentLabel)
    }
    
    private func adjustTitleOffSetCurrentIndex(currentIndex: Int, oldInfex: Int) {
        
        guard oldIndex != currentIndex else {
            
            return
            
        }
        
        let oldLabel = labeles[oldIndex]
        
        let currentLabel = labeles[currentIndex]
        
        currentLabel.currentScale = 1.1
        
        currentLabel.textColor = UIColor.whiteColor()
        
        oldLabel.textColor = JYColor(235, g: 235, b: 235, a: 1.0)
        
        oldLabel.currentScale = 1.0
        
        var offSetX = currentLabel.centerX - SCREENW * 0.5
        
        if offSetX < 0 {
            
            offSetX = 0
        
        }
        
        var maxOffsetX = scrollView.contentSize.width - (SCREENW - addButton.width)
        
        if maxOffsetX < 0 {
            
            maxOffsetX = 0
        
        }
        
        if offSetX > maxOffsetX {
            
            offSetX = maxOffsetX
        
        }
        
        scrollView.setContentOffset(CGPointMake(offSetX, 0), animated: true)
        
    
    }
    
    override var frame: CGRect {
        
        didSet {
            
            let newFrame = CGRectMake(0, 0, SCREENW, 44)
            
            super.frame = newFrame
        
        }
    }

}

class JYTitleLabel: UILabel {

    var currentScale: CGFloat = 1.0 {
        
        didSet {
        
            transform = CGAffineTransformMakeScale(currentScale, currentScale)
        }
    }
}
