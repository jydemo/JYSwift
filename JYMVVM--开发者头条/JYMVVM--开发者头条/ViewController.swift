//
//  ViewController.swift
//  JYMVVM--开发者头条
//
//  Created by atom on 16/5/8.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import SnapKit

let JYCellReuseIdentifier = "JYCell"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNav()
        
        setupUIS()
    
    }
    
    private func setupNav() {
        
        self.view.backgroundColor = UIColor.grayColor()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingBtn)
    
    }
    
    private func setupUIS() {
    
        //self.view.addSubview(HomeTableview)
        
        //let width = UIScreen.mainScreen().bounds.width
        
        //let height = UIScreen.mainScreen().bounds.height
        
        //HomeTableview.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: self.view, size: CGSize(width: width, height: height), offset: CGPoint(x: 0, y: 0))
        
        /*HomeTableview.snp_makeConstraints { (make) in
            
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            
        }*/
        
        let sv = UIView()
        
        self.view.addSubview(sv)
        
        sv.backgroundColor = UIColor.blueColor()
        
        sv.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            
            make.size.equalTo(CGSize(width: 300, height: 300))
        }
        
        let sv1 = UIView()
        
        sv1.backgroundColor = UIColor.redColor()
        
        //sv.addSubview(sv1)
        
        /*sv1.snp_makeConstraints { (make) in
            
            make.edges.equalTo(sv).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }*/
        
        let padding = 10
        
        let sv2 = UIView()
        
        sv2.backgroundColor = UIColor.brownColor()

        
        let sv3 = UIView()
        
        sv3.backgroundColor = UIColor.cyanColor()
        
        sv.addSubview(sv2)
        
        sv.addSubview(sv3)
        
        sv2.snp_makeConstraints { (make) in
            
            make.centerY.equalTo(sv.snp_centerY)
            
            make.left.equalTo(sv.snp_left).offset(padding)
            
            make.right.equalTo(sv3.snp_left).offset(-padding)
            
            make.height.equalTo(150)
            
            make.width.equalTo(sv3)
        }
        
        sv3.snp_makeConstraints { (make) in
            
            make.centerY.equalTo(sv.snp_centerY)
            
            make.left.equalTo(sv2.snp_right).offset(padding)
            
            make.right.equalTo(sv.snp_right).offset(-padding)
            
            make.height.equalTo(150)
            
            make.width.equalTo(sv2)
        }
        
        
    }
    
    
    private lazy var settingBtn: UIButton  = {
    
        let button = UIButton(type: UIButtonType.Custom)
    
        button.frame = CGRect(x: 0.0, y: 0.0, width: 23.0, height: 23.0)
    
        button.setImage(UIImage(named: "navigationbar_setting"), forState: .Normal)
    
        return button
    }()
    
    private lazy var HomeTableview: UITableView = {
        
        let tableview = UITableView()
        
        tableview.registerClass(JYCell.self, forCellReuseIdentifier: JYCellReuseIdentifier)
        
        tableview.dataSource = self
        
        tableview.delegate = self
        
        tableview.rowHeight = 66
        
        return tableview
    
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(JYCellReuseIdentifier, forIndexPath: indexPath) as!JYCell
        
        //cell.textLabel?.text = "toutiao"
        
        return cell
    }

}



