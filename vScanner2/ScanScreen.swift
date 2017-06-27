//
//  ScannerScreen.swift
//  vScanner2
//
//  Created by DatTran on 6/26/29 H.
//  Copyright © 29 Heisei ANSV. All rights reserved.
//

import Foundation
import UIKit

class ScanScreen: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let scanCell = "ScanCell"
    
    private let loading: UIActivityIndicatorView = {

        let ai = UIActivityIndicatorView()
        ai.hidesWhenStopped = true
        ai.stopAnimating()
        ai.color = UIColor.blackColor()
        return ai
        
    }()
    
    private let scanBtn: UIButton = {

        let btn = UIButton()
        btn.setTitle("SCAN", forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        btn.titleLabel?.textColor = UIColor.blackColor()
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        return btn
    
    }()
    
    private var mScanScreen = [MScanScreen]()
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        hud = Hud(superView: view)

        setupCollectionView()
        setupNavigationBar()
        
        
    }
    
    var hud: Hud?
    
    func setupDatas() {
        
        mScanScreen = [
        
            MScanScreen(deviceId: "\(CGFloat(drand48()))", deviceName: "BLE Node 1", deviceBattery: "12", rssi: "-35", sensorTxt: "90 LUX"),
            MScanScreen(deviceId: "\(CGFloat(drand48()))", deviceName: "BLE Node 2", deviceBattery: "56", rssi: "-25", sensorTxt: "100 LUX"),
            MScanScreen(deviceId: "\(CGFloat(drand48()))", deviceName: "BLE Node 3", deviceBattery: "33", rssi: "-85", sensorTxt: "35 LUX")

            
        ]
        
    }
    
    func setupCollectionView() {
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.backgroundColor = UIColor(red:0.98, green:0.96, blue:0.96, alpha:1.0)
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = true
        
        collectionView.registerClass(ScanCell.self, forCellWithReuseIdentifier: scanCell)
        
    }
    
    func setupNavigationBar() {
    
        
        navigationItem.title = "BLE Scanner"
        
        let version = UIBarButtonItem(title: "v2", style: .Plain, target: self, action: nil)
    
        let rightView = UIView()
        rightView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width/4, 40)
        rightView.addSubview(scanBtn)
        rightView.addSubview(loading)
        rightView.addConstrainsWithFormat("H:[v0]-5-[v1]|", views: loading, scanBtn)
        rightView.addConstrainsWithFormat("V:|[v0]|", views: loading)
        rightView.addConstrainsWithFormat("V:|[v0]|", views: scanBtn)
        
        scanBtn.addTarget(self, action: #selector(handleScan), forControlEvents: .TouchUpInside)
        
        rightView.tintColor = UIColor.blackColor()
        
        let scan = UIBarButtonItem(customView: rightView)
        
        navigationItem.leftBarButtonItems = [version]
        navigationItem.setRightBarButtonItems([scan], animated: true)
        
        
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mScanScreen.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(scanCell, forIndexPath: indexPath) as! ScanCell

        cell.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        cell.layer.cornerRadius = 3.0
        
        cell.mScanScreen = mScanScreen[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 1.0
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let size = CGSizeMake(UIScreen.mainScreen().bounds.width, 95)
        return size
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let controller = SplashScreen()
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    private var isScan = true
    
    func handleScan(sender: UIButton) {
        
        if (isScan) {
            hud?.startHud()
            sender.setTitle("STOP", forState: .Normal)
            loading.startAnimating()
            setupDatas()
        } else {
            hud?.stopHud()
            sender.setTitle("SCAN", forState: .Normal)
            loading.stopAnimating()
//            mScanScreen.removeAll()
        }
        collectionView?.reloadData()
        isScan = !isScan

    }
    
}