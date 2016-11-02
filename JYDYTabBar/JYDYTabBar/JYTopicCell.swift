//
//  JYTopicCell.swift
//  JYDYTabBar
//
//  Created by atom on 16/4/27.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import Alamofire

class JYTopicCell: UITableViewCell {
    
    override var frame: CGRect {
    
        get {
        
            return super.frame
            
        }
        
        set {
        
            super.frame.origin.x = 3
            
            super.frame.size.width = super.frame.size.width - 6
            
            super.frame.origin.y = super.frame.origin.y + 5
            
            super.frame.size.height = super.frame.size.height - 5
        }
    
    }
    
    var bottomConts: NSLayoutConstraint?
    
    var request: Alamofire.Request?
    
    var topic: JYTopics? {
        
        didSet {
        
            self.name.text = topic!.name
                
            if let create_at = topic!.created_at {
                
                //let created = NSDate.sinaDate(create_at)
                
                let jytime = NSDate.sinaDate(create_at)
                
                
                
                print("----\(jytime?.dateDesctiption)-----")
                
                self.time.text = jytime?.dateDesctiption
                
                //print("\(created)")
            
            }
            
            self.contentLabel.text = topic!.text
            
            self.bottomview.topic = topic!
            
            if let imageURL = topic!.profile_image {
                
                
                
                self.profileImageview.image = nil
                
                self.request?.cancel()
                
                self.request = Alamofire.request(.GET, imageURL).responseImage({ (response) in
                    
                    guard let image = response.result.value where response.result.error == nil else { return }
                    
                    self.profileImageview.image = image!.cicleImage()
                    
                })
            
            }
            
            /* BudejieNetTool.loadThememage( topic!.profile_image) { (data, errr) in
             
             if data != nil && errr == nil {
             
             
             self.profileImageview.image = UIImage(data: data!)
             }
             }*/
            
        
        }
    
    }
    
    
    
    
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUIS()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupUIS() {
        
        contentView.addSubview(profileImageview)
    
        contentView.addSubview(contentLabel)
        
        contentView.addSubview(name)
        
        contentView.addSubview(time)
        
        contentView.addSubview(bottomview)
        
        let width = UIScreen.mainScreen().bounds.width
        
        profileImageview.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: contentView, size: CGSize(width: 35, height: 35), offset: CGPoint(x: 20, y: 15))
        
        name.xmg_AlignHorizontal(type: XMG_AlignType.TopRight, referView: profileImageview, size: nil, offset: CGPoint(x: 10, y: 0))
        
        time.xmg_AlignHorizontal(type: XMG_AlignType.BottomRight, referView: profileImageview, size: nil, offset: CGPoint(x: 10, y: -5))
        
        contentLabel.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: profileImageview, size: nil, offset: CGPoint(x: 25, y: 10))
        
       // bottomview.xmg_AlignHorizontal(type: XMG_AlignType.BottomLeft, referView: contentLabel, size: CGSize(width: width, height: 54), offset: CGPoint(x: 0, y: 10))
        
       let cons =  bottomview.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: contentLabel, size: CGSize(width: width, height: 44), offset: CGPoint(x: -40, y: 10))
        
        //bottomview.xmg_AlignInner(type: XMG_AlignType.BottomLeft, referView: contentView, size: CGSize(width: width, height: 44), offset: CGPoint(x: 0, y: -10))
        
        self.bottomConts = xmg_Constraint(cons, attribute: NSLayoutAttribute.Top)
    
    }
    
    func getRowHeight(topic: JYTopics) -> CGFloat {
        
        let width = self.frame.size.width
        
        let height = self.frame.size.height
        
        let x = self.frame.origin.x
        
        self.frame = CGRect(x: 5, y: self.frame.origin.y + 10, width: width - x , height: height - 1)
        
        self.topic = topic
    
        self.layoutIfNeeded()
        
        return CGRectGetMaxY(bottomview.frame)
        
    }
    
    private lazy var contentLabel: UILabel = {
    
        let label = UILabel()
        
        label.font = UIFont.systemFontOfSize(16)
        
        label.numberOfLines = 0
        
        label.preferredMaxLayoutWidth = self.contentView.frame.size.width
        
        return label
    
    }()
    
    private lazy var name: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFontOfSize(13)
        
        return label
    
    }()
    
    private lazy var time: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFontOfSize(11)
        
        return label
        
    }()
    
    
    
    private lazy var profileImageview: UIImageView = {
    
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "defaultUserIcon")
        
        return imageView
    
    }()
    private lazy var bottomview: JYBottomView = JYBottomView()
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        /*let width = self.frame.size.width
        
        let height = self.frame.size.height
        
        let x = self.frame.origin.x
        
        self.frame = CGRect(x: 5, y: self.frame.origin.y, width: width - x , height: height - 1)*/
        
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
