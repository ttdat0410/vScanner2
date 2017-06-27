//
//  ScanCell.swift
//  vScanner2
//
//  Created by DatTran on 6/26/29 H.
//  Copyright © 29 Heisei ANSV. All rights reserved.
//

import Foundation
import UIKit

class ScanCell: BaseCell {
    
    
    var mScanScreen: MScanScreen? {
    
        didSet {
        
            deviceNameTxt.text = mScanScreen?.deviceName
            deviceBatteryTxt.text = mScanScreen?.deviceBattery
            rssiTxt.text = mScanScreen?.rssi
            sensor1Txt.text = mScanScreen?.sensor1Txt
            
        }
        
    }
    
    
    let horLine: UIView = {

        let v = UIView()
        v.backgroundColor = UIColor.lightGrayColor()
        return v
    
    }()
    
    // INFO
    let deviceNameTxt: UILabel = {

        let lb = UILabel()
        lb.text = "BLE_ansv, new protocol"
        lb.textAlignment = .Left
        lb.font = UIFont.boldSystemFontOfSize(17.0)
        lb.textColor = UIColor.blackColor()
        return lb
    }()
    
    let deviceBatteryTxt: UILabel = {
        
        let lb = UILabel()
        lb.text = "100%"
        lb.textAlignment = .Left
        lb.font = UIFont.systemFontOfSize(13.0)
        lb.textColor = UIColor.blackColor()
        return lb
    }()
    
    let deviceBatteryImg: UIImageView = {

        let iv = UIImageView()
        iv.image = UIImage(named: "ic_battery75_30")
        return iv
    
    }()

    
    // RSSI
    let rssiTxt: UILabel = {

        let lb = UILabel()
        lb.text = "-37"
        lb.font = UIFont.boldSystemFontOfSize(12.0)
        lb.textColor = UIColor.blackColor()
        return lb
    
    }()
    
    let rssiImg: UIImageView = {

        let iv = UIImageView()
        iv.image = UIImage(named: "ic_3_bar_25")
        return iv
    
    }()
    
    // DATA
    let sensor1Txt: UILabel = {

        let lb = UILabel()
        lb.text = "25 LUX"
        lb.textColor = UIColor.redColor()
        lb.font = UIFont.systemFontOfSize(13.0)
        lb.textAlignment = .Center
        return lb
        
    }()
    
    let sensor1Img: UIImageView = {

        let iv = UIImageView()
        iv.image = UIImage(named: "sun")
        
        return iv
    
    }()
    
    let sensor2Txt: UILabel = {
        
        let lb = UILabel()
        lb.text = "30°C"
        lb.textColor = UIColor.redColor()
        lb.font = UIFont.systemFontOfSize(13.0)
        lb.textAlignment = .Center
        return lb
        
    }()
    
    let sensor2Img: UIImageView = {
        
        let iv = UIImageView()
        iv.image = UIImage(named: "thermometer")
        
        return iv
        
    }()
    
    let sensor3Txt: UILabel = {
        
        let lb = UILabel()
        lb.text = "50 mm"
        lb.textColor = UIColor.redColor()
        lb.font = UIFont.systemFontOfSize(13.0)
        lb.textAlignment = .Center
        return lb
        
    }()
    
    let sensor3Img: UIImageView = {
        
        let iv = UIImageView()
        iv.image = UIImage(named: "peach")
        
        return iv
        
    }()
    
    override func setupViews() {
        
        let infoViews = UIView()
        let rssiViews = UIView()
        let dataViews = UIView()
        
        addSubview(rssiViews)
        addSubview(infoViews)
        addSubview(dataViews)
        addSubview(horLine)
    
        addConstrainsWithFormat("H:[v0(\(UIScreen.mainScreen().bounds.width-60))][v1(60)]|", views: infoViews, rssiViews)
        addConstrainsWithFormat("H:|[v0]|", views: horLine)
        addConstrainsWithFormat("V:[v0(1)]|", views: horLine)
        addConstrainsWithFormat("H:|[v0]|", views: dataViews)
        addConstrainsWithFormat("V:|-8-[v0(40)]", views: infoViews)
        addConstrainsWithFormat("V:|-8-[v0(40@250)]", views: rssiViews)
        addConstrainsWithFormat("V:[v0]-5-[v1(25)]", views: infoViews, dataViews)
        
        // INFO
        infoViews.addSubview(deviceNameTxt)
        infoViews.addSubview(deviceBatteryTxt)
        infoViews.addSubview(deviceBatteryImg)
        
        infoViews.addConstrainsWithFormat("H:|-10-[v0]-10-|", views: deviceNameTxt)
        infoViews.addConstrainsWithFormat("H:|-10-[v0(25)]-5-[v1]", views: deviceBatteryImg, deviceBatteryTxt)
        infoViews.addConstrainsWithFormat("V:|[v0(20)]", views: deviceNameTxt)
        infoViews.addConstrainsWithFormat("V:[v0(20)]|", views: deviceBatteryImg)
        infoViews.addConstrainsWithFormat("V:[v0(20)]", views: deviceBatteryTxt)
        
        infoViews.addConstraint(NSLayoutConstraint(item: deviceBatteryTxt, attribute: .CenterY, relatedBy: .Equal, toItem: deviceBatteryImg, attribute: .CenterY, multiplier: 1, constant: 0))
        
        //RSSI
        rssiViews.addSubview(rssiImg)
        rssiViews.addSubview(rssiTxt)
        rssiViews.addConstrainsWithFormat("H:|[v0(20)]-2-[v1]", views: rssiImg, rssiTxt)
        rssiViews.addConstrainsWithFormat("V:[v0(20)]", views: rssiImg)
        rssiViews.addConstrainsWithFormat("V:[v0]", views: rssiTxt)
        
        rssiViews.addConstraint(NSLayoutConstraint(item: rssiImg, attribute: .CenterY, relatedBy: .Equal, toItem: rssiViews, attribute: .CenterY, multiplier: 1, constant: 0))

        rssiViews.addConstraint(NSLayoutConstraint(item: rssiTxt, attribute: .Bottom, relatedBy: .Equal, toItem: rssiImg, attribute: .Bottom, multiplier: 1, constant: 0))
        
        // DATA
        
        let w = UIScreen.mainScreen().bounds.width / 3

        
        dataViews.addSubview(sensor1Img)
        dataViews.addSubview(sensor2Img)
        dataViews.addSubview(sensor3Img)
        
        dataViews.addSubview(sensor1Txt)
        dataViews.addSubview(sensor2Txt)
        dataViews.addSubview(sensor3Txt)
        
        dataViews.addConstrainsWithFormat("H:|-7-[v0(25)]-3-[v1]", views: sensor1Img, sensor1Txt)
        dataViews.addConstrainsWithFormat("V:|[v0(25)]", views: sensor1Img)
        dataViews.addConstrainsWithFormat("V:[v0]", views: sensor1Txt)
        
        dataViews.addConstrainsWithFormat("H:|-\(w+7)-[v0(25)]-3-[v1]", views: sensor2Img, sensor2Txt)
        dataViews.addConstrainsWithFormat("V:|[v0(25)]", views: sensor2Img)
        dataViews.addConstrainsWithFormat("V:|[v0]", views: sensor2Txt)
        
        dataViews.addConstrainsWithFormat("H:|-\(2*w+7)-[v0(25)]-3-[v1]", views: sensor3Img, sensor3Txt)
        dataViews.addConstrainsWithFormat("V:|[v0(25)]", views: sensor3Img)
        dataViews.addConstrainsWithFormat("V:|[v0]", views: sensor3Txt)
        
        
        dataViews.addConstraint(NSLayoutConstraint(item: sensor1Txt, attribute: .CenterY, relatedBy: .Equal, toItem: sensor1Img.self, attribute: .CenterY, multiplier: 1, constant: 0))
        
        
        dataViews.addConstraint(NSLayoutConstraint(item: sensor2Txt, attribute: .CenterY, relatedBy: .Equal, toItem: sensor2Img.self, attribute: .CenterY, multiplier: 1, constant: 0))

        
        dataViews.addConstraint(NSLayoutConstraint(item: sensor3Txt, attribute: .CenterY, relatedBy: .Equal, toItem: sensor3Img.self, attribute: .CenterY, multiplier: 1, constant: 0))

        
    }
    
}