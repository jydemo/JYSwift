//
//  JYCommentsTableViewController.swift
//  JYDYTabBar
//
//  Created by atom on 16/5/4.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import Alamofire

import MJRefresh

let JYCommientReusableID = "JYComment"

let JYCommientHeaderReusableID = "JYHeader"

class JYCommentsTableViewController: UITableViewController {
    
    var topic: JYTopics?
    
    var headerHieht: CGFloat?
    
    var hotComments: [Comments]?
    
    var lastComments: [Comments]?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.hidden = true
        
        tableView.registerClass(JYCommentCell.self, forCellReuseIdentifier: JYCommientReusableID)
        
        tableView.registerClass(JYCommentCell.self, forCellReuseIdentifier: JYCommientReusableID)
        
        tableView.registerClass(SectionView.self, forHeaderFooterViewReuseIdentifier: JYCommientHeaderReusableID)
        
        tableView.rowHeight = 84
        
        addRefresh()
        
        setupUIS()
        
        
        
        //print("\(self.topic!.id)")
        
        /*Alamofire.request(.GET, "http://api.budejie.com/api/api_open.php", parameters: ["a": "dataList", "c": "comment", "data_id":
            self.topic!.id!     , "hot": "1"], encoding: ParameterEncoding.URLEncodedInURL, headers: nil).responseJSON { (response) in
                
                if response.result.isSuccess {
                    
                    let lastComments = response.result.value!["data"] as? [[String: AnyObject]]
                    
                    let hotComments = response.result.value!["hot"] as? [[String: AnyObject]]
                    
                    let lastcomment = Comments.mode2Object(lastComments!)
                    
                    let hotcomment = Comments.mode2Object(hotComments!)
                    
                    //print("评论的对象有哪些\(lastcomment.last?.content) --- \(hotcomment.count)")
                    
                    dispatch_async(dispatch_get_main_queue(), { 
                        
                        self.hotComments = hotcomment
                        
                        self.lastComments = lastcomment
                        
                        self.tableView.reloadData()
                        
                        
                    })
                
                }
        }*/
        
        
    }
    
    
    
    private func setupUIS() {
        
        self.view.backgroundColor = UIColor.grayColor()
        tableView.tableHeaderView?.frame.origin.x = 10
        
        let width = tableView.tableHeaderView?.frame.width
        
        let height = tableView.tableHeaderView?.frame.height
        
        tableView.tableHeaderView?.frame = CGRect(x: 10, y: 0, width: width! - 20, height: height!)
        
        //let headerCell = JYTopicCell()
        headerView.topic = self.topic
        
        headerView.contentHieht = self.headerHieht
        
        headerView.frame.size.height = self.headerHieht! + 10.0
        
        headerView.contentCellHeight?.constant = self.headerHieht!
        
        tableView.tableHeaderView = self.headerView
        
        
    
    }
    
    private lazy var headerView: JYHeaderView = {
        
        let view = JYHeaderView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 325))
        
        view.backgroundColor = UIColor.whiteColor()
        
        return view
    
    }()
    
    private func  addRefresh(){
        
        let  header  =  MJRefreshNormalHeader()
        
        header.setRefreshingTarget(self, refreshingAction: #selector(loadComments))
        
        self.tableView.mj_header = header
        
        self.tableView.mj_header.beginRefreshing()
    
    }
    
    func loadComments() {
        
        Alamofire.request(.GET, "http://api.budejie.com/api/api_open.php", parameters: ["a": "dataList", "c": "comment", "data_id":
            self.topic!.id!     , "hot": "1"], encoding: ParameterEncoding.URLEncodedInURL, headers: nil).responseJSON { (response) in
                
                if response.result.isSuccess {
                    
                    let lastComments = response.result.value!["data"] as? [[String: AnyObject]]
                    
                    let hotComments = response.result.value!["hot"] as? [[String: AnyObject]]
                    
                    let lastcomment = Comments.mode2Object(lastComments!)
                    
                    let hotcomment = Comments.mode2Object(hotComments!)
                    
                    //print("评论的对象有哪些\(lastcomment.last?.content) --- \(hotcomment.count)")
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        self.hotComments = hotcomment
                        
                        self.lastComments = lastcomment
                        
                        self.tableView.reloadData()
                        
                        self.tableView.mj_header.endRefreshing()
                        
                    })
                    
                }
        }
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func commetCount(section: Int) -> Int {
        
        var count = 0
        
        if section == 0 {
            
            if self.hotComments?.count != 0 {
                
                count = self.hotComments?.count ?? 0
                
            } else {
                
                count = lastComments?.count ?? 0
                
                return count
            }
            
        } else {
            
            count = lastComments?.count ?? 0
        }
        
        return count
    }
    
    
    
    private func setCellComment(indexpath: NSIndexPath) -> Comments {
        
        if indexpath.section == 0 {
            
            if hotComments?.count != 0 {
                
                return self.hotComments![indexpath.row]
                
            } else {
                
                return self.lastComments![indexpath.row]
                
            }
            
        } else {
            
            return self.lastComments![indexpath.row]
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        if self.hotComments?.count != 0 {
        
            return 2
            
        }
        
        if self.lastComments?.count != 0 {
        
            return 1
        
        }
        
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var count = 0
        
        count = commetCount(section)
        
       /* if section == 0 {
            
            if let hotComments = self.hotComments {
            
                count = hotComments.count
                
            } else {
            
                count = lastComments?.count ?? 0
                
                return count
            }
        
        } else {
        
            count = lastComments?.count ?? 0
        }*/
        
        
        
        return count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        /*let secView = UIView()
        
        let seclabel = UILabel()
        
        seclabel.font = UIFont.systemFontOfSize(11)
        
        seclabel.text = "some"*/
        
        let secView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(JYCommientHeaderReusableID) as! SectionView
        
        
        print(secView.frame)
       
        
        if section == 0 {
            
            if self.hotComments?.count != 0 {
            
               secView.labelTitle =  "最热评论"
            
            } else {
            
                 secView.labelTitle = "最新评论"
            }
            
            
            
        } else {
            
            secView.labelTitle = "最新评论"
            
        
        }
        
       /*seclabel.frame.size.width = 200
        
        seclabel.frame.origin.x = 20
        
        seclabel.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        
        secView.addSubview(seclabel)*/
        
        return secView
        
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title: String?
        
        if section == 0 {
            
            title = "   " //self.hotComments?.count == 0 ? "最新评论" : "最热评论"
        
        } else {
            
            title = "   "//"最新评论"
        
        
        }
        
        return title
        
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(JYCommientReusableID, forIndexPath: indexPath) as! JYCommentCell
        
        print("section  \(setCellComment(indexPath))")
        
        
        
        if indexPath.section == 0 {
            
            if self.hotComments?.count == 0 {
                
                print("\(self.lastComments![indexPath.row])")
                
                let lastcomment = self.lastComments![indexPath.row]
                
                cell.comment = lastcomment
                
                return cell
                
            } else {
            
                let hotcomment = self.hotComments![indexPath.row]
                
                cell.comment = hotcomment
            
            }
        
        
        } else {
        
            let lastcomment = self.lastComments![indexPath.row]
            
            cell.comment = lastcomment
        
        }

        return cell
    }

}

class JYCommentCell: UITableViewCell {
    
    var request: Alamofire.Request?
    
    var comment: Comments? {
    
        didSet {
            
            self.commentLabel.text = comment!.content
            
            self.userNamelabel.text = comment!.user?.username
            
            if let imageURL = comment!.user!.profile_image {
                
                
                
                self.proImageview.image = nil
                
                self.request?.cancel()
                
                self.request = Alamofire.request(.GET, imageURL).responseImage({ (response) in
                    
                    guard let image = response.result.value where response.result.error == nil else { return }
                    
                    self.proImageview.image = image!.cicleImage()
                    
                })
                
            }
    
        }
    
    
    }
    
    override var frame: CGRect {
        
        get {
        
            return super.frame
        }
        
        set {
        
            super.frame.origin.x = 15
            
            super.frame.size.width =  super.frame.size.width - 30
            
            super.frame.origin.y = super.frame.origin.y + 5
            
            super.frame.size.height =  super.frame.size.height - 5
        }
    
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUIs()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUIs() {
        
        self.contentView.addSubview(proImageview)
        
        self.contentView.addSubview(userNamelabel)
        
        self.contentView.addSubview(commentLabel)
        
        proImageview.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: self.contentView, size: CGSize(width: 30, height: 30), offset: CGPoint(x: 10, y: 10))
        
        userNamelabel.xmg_AlignHorizontal(type: XMG_AlignType.TopRight, referView: self.proImageview, size: nil, offset: CGPoint(x: 5, y: 0))
        
        commentLabel.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: userNamelabel, size: nil,offset:  CGPoint(x: 0, y: 20))
    
    }
    
    private lazy var proImageview: UIImageView = {
    
        let imageview = UIImageView()
        
        
        return imageview
    
    }()
    
    
    private lazy var commentLabel: UILabel  = {
        
        let lab = UILabel()
        
        
        lab.font = UIFont.systemFontOfSize(13)
        
        lab.numberOfLines = 0
        
        lab.preferredMaxLayoutWidth = self.contentView.frame.size.width
        
        
        return lab
    
    
    }()
    
    private lazy var userNamelabel: UILabel = {
    
        let lab = UILabel()
        
        lab.font = UIFont.systemFontOfSize(11)
        
        
        return lab
    
    }()

}
