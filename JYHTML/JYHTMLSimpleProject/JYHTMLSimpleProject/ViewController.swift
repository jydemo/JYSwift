//
//  ViewController.swift
//  JYHTMLSimpleProject
//
//  Created by atom on 16/2/21.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import Alamofire



class ViewController: UIViewController {
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var cycleLoadViw: JYCycleLoaderView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView: UIImageView!
    
    let url = "http://www.javlibrary.com/cn/?v=javlildbs4"
    
    var titles: Array<String> = []
    
    var contents: Array<String> = []
    
    
    var dataList: [Status]? {
        
        didSet {
            
            tableView.reloadData()
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // cycleLoadViw.startAnimation()
        
        //fetchCharts()
        
        setUI()
        
        loadData()
        
        
    }
    
    private lazy var tableView: UITableView = {
        
        let table = UITableView()
        
        table.dataSource = self
        
        table.delegate = self
        
        table.frame = UIScreen.mainScreen().bounds
        
        
        
        //table.registerClass(UITableViewCell.self, forCellReuseIdentifier: homeCellID)
        
        table.registerNib(UINib(nibName: "JYHomeCell", bundle: nil), forCellReuseIdentifier: homeCellID)
        
        return table
        
    }()
   

    


}

extension ViewController {
    
    func setUI() {
        
        tableView.rowHeight = tableRowHeight
        
        tableView.estimatedRowHeight = tableEstimatedRowHeight
        
        view.addSubview(tableView)
        
    }
    
    func loadData() {
        
        Alamofire.request(.GET, homeurl).responseJSON { (response) in
            
            if let dataJSON = response.result.value {
                
                if let modules = dataJSON["statuses"] as? [[String: AnyObject]] {
                    
                    self.dataList = Status.status(modules)
                    
                }
            
            }
            
        }
        
        getDataFormURL(homeurl, method: .GET, parameter: nil) { (data) in
            
           
        
        }
    
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(homeCellID, forIndexPath: indexPath) as! JYHomeCell
        
        cell.status = dataList![indexPath.row]
        
        return cell
    }
    
}

