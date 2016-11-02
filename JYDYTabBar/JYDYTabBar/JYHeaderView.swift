//
//  JYHeaderView.swift
//  JYDYTabBar
//
//  Created by atom on 16/5/4.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import Alamofire

class JYHeaderView: UIView {
    
    var contentcell: JYTopicCell?
    
    var request: Alamofire.Request?
    
    var contentHieht: CGFloat?
    
    var contentCellHeight: NSLayoutConstraint?
    
    var topic: JYTopics? {
        
        didSet {
            
            /*self.name.text = topic!.name
            
            if let createAt = topic!.created_at {
                
                self.dealtime(createAt)
                
                let now = NSDate()
                
                if createAt.isYear() {
                    
                    if createAt.isToday() {
                        
                        let coms = now.equalDate(createAt)
                        
                        print("\(coms)")
                        
                        if coms.hour > 1 {
                            
                            self.time.text = "\(coms.hour)小时前"
                            
                        } else if coms.minute >= 1 {
                            
                            self.time.text = "\(coms.minute)分钟前"
                            
                        } else {
                            
                            self.time.text = "刚刚"
                            
                            
                            
                        }
                        
                        
                    } else if createAt.isYesterday() {
                        
                        let yescreate = createAt.componentsSeparatedByString(" ").last
                        
                        self.time.text = "昨天\(yescreate!)"
                        
                        
                    }
                    
                } else {
                    
                    self.time.text = topic!.created_at
                    
                }
                
                
            }
            
            
            
            
            
            self.contentLabel.text = topic!.text
            
            self.bottomview.topic = topic!
            
            if let imageURL = topic!.profile_image {
                
                
                
                self.profileImageview.image = nil
                
                self.request?.cancel()
                
                self.request = Alamofire.request(.GET, imageURL).responseImage({ (response) in
                    
                    guard let image = response.result.value where response.result.error == nil else { return }
                    
                    self.profileImageview.image = image
                    
                })
                
            }*/
            
            self.contentCell.topic = topic!
            
        }
    
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUIS()
        
    }
    
    private func dealtime(tm1: String?) {
        
        
        let  calendar = NSCalendar.currentCalendar()
        
        let create = NSDateFormatter()
        
        create.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        let fromDate = create.dateFromString(tm1!)
        
        let unit = NSCalendarUnit()
        
        let now = NSDate()
        
        let day = calendar.components(unit, fromDate: fromDate!, toDate: now, options: NSCalendarOptions(rawValue: 0))
        
    }
    
    private func setupUIS() {
        
        self.backgroundColor = UIColor.blueColor()
        
        self.addSubview(contentCell)
        
        self.contentcell = contentCell
        
        let cons = contentCell.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: self, size: CGSize(width: self.frame.size.width, height: self.frame.size.height), offset: CGPoint(x: 0, y: 15))
        
        self.contentCellHeight = xmg_Constraint(cons, attribute: NSLayoutAttribute.Height)
        
       /* self.addSubview(profileImageview)
        
        self.addSubview(contentLabel)
        
        self.addSubview(name)
        
        self.addSubview(time)
        
        self.addSubview(bottomview)
        
        let width = UIScreen.mainScreen().bounds.width
        
        profileImageview.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: self, size: CGSize(width: 50, height: 50), offset: CGPoint(x: 10, y: 10))
        
        name.xmg_AlignHorizontal(type: XMG_AlignType.TopRight, referView: profileImageview, size: nil, offset: CGPoint(x: 10, y: 0))
        
        time.xmg_AlignHorizontal(type: XMG_AlignType.BottomRight, referView: profileImageview, size: nil, offset: CGPoint(x: 10, y: -10))
        
        contentLabel.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: profileImageview, size: nil, offset: CGPoint(x: 5, y: 10))
        
        // bottomview.xmg_AlignHorizontal(type: XMG_AlignType.BottomLeft, referView: contentLabel, size: CGSize(width: width, height: 54), offset: CGPoint(x: 0, y: 10))
        
        bottomview.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: contentLabel, size: CGSize(width: width, height: 44), offset: CGPoint(x: -30, y: 10))*/
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contentCell: JYTopicCell = {
        
        let cell = JYTopicCell()
        
        return cell
    
    
    }()
    
    private lazy var contentLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFontOfSize(16)
        
        label.numberOfLines = 0
        
        label.preferredMaxLayoutWidth = self.frame.size.width - 30.0
        
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

}
