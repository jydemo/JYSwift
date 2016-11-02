//
//  JYChoiceViewController.swift
//  JY-EyepetizerApp
//
//  Created by atom on 16/6/12.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

import Alamofire

class JYChoiceViewController: JYBaseViewController {
    
    var issusList: [IssueModel] = [IssueModel]()
    
    var nextPageURL: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(loaderView)
        
        self.view.addSubview(collectionview)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        
        loaderView.startLoadingAnimation()
        
        getData(JYAPIHelper.API_Choice, params: ["date" : NSDate.getCurrentTimeStamp(), "num": "7"])
        
        setLoaderViewHidden(false)
        
    }
    
    private func getData(api: String, params: [String: AnyObject]? = nil) {
        
        Alamofire.request(.GET, api, parameters: params, encoding: ParameterEncoding.URLEncodedInURL, headers: nil).responseSwiftJSON { (request, response, json, error) in
            
            if json != .null && error == nil {
                
                let dict = json.rawValue as!  NSDictionary
                
                self.nextPageURL = dict["nextPageUrl"] as? String
                
                let issueArray = dict["issueList"] as! [NSDictionary]
                
                let list = issueArray.map({ (dict) -> IssueModel in
                    
                    return IssueModel(dict: dict)
                    
                })
                
                if let _ = params {
                    
                    self.issusList = list
                    
                    //self.collectionview.
                
                } else {
                
                    self.issusList.appendContentsOf(list)
                }
                
                self.setLoaderViewHidden(true)
                
                self.collectionview.reloadData()
            }
        }
    
    }
    
    private lazy var loaderView: JYLoaderview = {
        
        let loaderview = JYLoaderview(frame: CGRect(x: 0, y: 0, width: UIConstant.SCREEN_WIDTH, height: 100))
        
        loaderview.center = CGPoint(x: UIConstant.SCREEN_WIDTH * 0.5, y: UIConstant.SCREEN_HEIGHT * 0.4)
        
        return loaderview
        
    }()
    
    private lazy var menuButton: JYMenuButton  = {
    
            let menuButton = JYMenuButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), type: .None)
    
            menuButton.addTarget(self, action: #selector(menuButtonClick), forControlEvents: .TouchUpInside)
    
            //self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
    
        return menuButton
    
    }()
    
    func menuButtonClick() {
         print("somm")
    }
    
    private lazy var collectionview: JYCollectionView = {
    
        var collectionView: JYCollectionView = JYCollectionView(frame: self.view.bounds, collectionViewLayout: JYCollectionLayout())
        
        collectionView.registerClass(JYChoiceHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: JYChoiceHeaderView.reuseID)
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        return collectionView
        
    }()
    
    
    
    
    func setLoaderViewHidden(hidden: Bool){
            
            loaderView.hidden = hidden
            
            if hidden {
                
                loaderView.stopLoadingAnimation()
                
            } else {
                
                loaderView.startLoadingAnimation()
            }
    }
    
    func startLoadinganimation() {
        
        loaderView.startLoadingAnimation()
        
    }
    
    func stopLoadinganimation() {
        
        loaderView.stopLoadingAnimation()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JYChoiceViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return issusList.count
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let issueModel: IssueModel = issusList[section]
        
        let itemList = issueModel.itemList
        
        return itemList.count
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = cell as! JYChoiceCell
        
        let issueModel = issusList[indexPath.section]
        
        cell.model = issueModel.itemList[indexPath.row]
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: JYChoiceCell = collectionView.dequeueReusableCellWithReuseIdentifier(JYChoiceCell.reuseID, forIndexPath: indexPath) as! JYChoiceCell
        
        return cell
        
    }
    
    

}

extension JYChoiceViewController {
    
    

}
