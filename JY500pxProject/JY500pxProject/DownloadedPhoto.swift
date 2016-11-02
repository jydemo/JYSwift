//
//  DownloadedPhoto.swift
//  JY500pxProject
//
//  Created by atom on 16/5/3.
//  Copyright © 2016年 cyin. All rights reserved.
//

import UIKit

let DownloadCellWithReuseIdentifier = "PhotoDownloadCell"

class DownloadedPhoto: UIViewController {
    
    var downloadPhotoURLs: [NSURL]? {
        
        didSet {
            
            DownloadCollectionview.reloadData()
        
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setNav()
        
        setupUIs()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let dir = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        var error: NSError?
        
        var urls: [AnyObject]?
        
        do {
        
            urls = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(dir, includingPropertiesForKeys: nil, options: [])
        
        } catch let error1 as NSError {
        
            error = error1
            
            urls = nil
        }
        
        if error == nil {
        
            downloadPhotoURLs = urls as? [NSURL]
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setNav() {
    
        navigationItem.titleView = navTitleView
        
        navigationController?.setToolbarHidden(true, animated: true)
        
    }
    
    private func setupUIs() {
    
        self.view.addSubview(DownloadCollectionview)
        
        let frame = self.view.frame.size
        
        let size = CGSize(width: frame.width, height: frame.height)
        
        DownloadCollectionview.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: self.view, size: size,offset: CGPoint(x: 0, y: 0))
    
    }
    
    private lazy var DownloadCollectionview: UICollectionView = {
        
        let size = self.view.frame.size
        
        let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    
        let collectionview = UICollectionView(frame: frame, collectionViewLayout: DownloadLayout())
        
        
        collectionview.registerClass(DownloadedPhotoBrowserCollectionViewCell.self, forCellWithReuseIdentifier: DownloadCellWithReuseIdentifier)
        
        collectionview.dataSource = self
        
        
        return collectionview
    
    
    }()
    
    private lazy var navTitleView: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 30.0))
        
        
        label.text = "Photomania"
        
        label.textColor = UIColor.whiteColor()
        
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        
        return label
    
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DownloadedPhoto: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return self.downloadPhotoURLs?.count ?? 0
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(DownloadCellWithReuseIdentifier, forIndexPath: indexPath) as! DownloadedPhotoBrowserCollectionViewCell
        
        let path = self.downloadPhotoURLs![indexPath.row].path
        
        let localFileData = NSFileManager.defaultManager().contentsAtPath(path!)
        
        cell.imageData = localFileData
        
        return cell
        
    }

}

class DownloadLayout: UICollectionViewFlowLayout {
    
    

    override func prepareLayout() {
        
        let size = CGSize(width: (collectionView?.frame.width)!, height: 200.0)
        
        itemSize = size
        
        
        minimumInteritemSpacing = 10.0
        
    }

}

class DownloadedPhotoBrowserCollectionViewCell: UICollectionViewCell {
    
    var imageData: NSData? {
        
        didSet {
            
            downloadImageview.image = UIImage(data: imageData!, scale: UIScreen.mainScreen().scale)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUIs()
    }
    
    private func setupUIs() {
        
        self.contentView.addSubview(downloadImageview)
        
        downloadImageview.xmg_Fill(self.contentView)
    
    }
    
    
    private lazy var downloadImageview: UIImageView = {
    
        let image = UIImageView()
        
        image.contentMode = .ScaleAspectFit
        return image
    
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
