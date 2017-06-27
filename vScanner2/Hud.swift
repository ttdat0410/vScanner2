//
//  Hud.swift
//  vScanner2
//
//  Created by DatTran on 6/27/29 H.
//  Copyright © 29 Heisei ANSV. All rights reserved.
//

import Foundation
import UIKit

class Hud: NSObject {
    
    var superView: UIView = UIView()
    var subView: UIView = UIView()
    var vHud: UIView = UIView()
    
    init(superView: UIView) {
        super.init()
        self.initHud()
        self.superView = superView
        
        subView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        subView.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.3)
        subView.layer.cornerRadius = 10.0
        subView.center = (self.superView.center)
        subView.tag = 1000
        
    }
    
    func startHud() {
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            
            self.superView.addSubview(self.subView)
            
            }, completion: nil)
        
        
    }
    
    func stopHud() {
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            
            let subviews = self.superView.subviews
            
            for subview in subviews {
                
                if (subview.tag == 1000) {
                    subview.removeFromSuperview()
                }
                
            }
            
            
            }, completion: nil)
        
        
        
    }
    
    func initHud() {
        
        let ai = UIActivityIndicatorView()
        ai.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        ai.hidesWhenStopped = true
        ai.color = UIColor.blackColor()
        ai.startAnimating()
        ai.activityIndicatorViewStyle = .WhiteLarge
        
        let status = UILabel()
        status.frame = CGRect(x: 60, y: 0, width: 150, height: 50)
        status.text = "loading..."
        status.textColor = UIColor.whiteColor()
        status.font = UIFont.systemFontOfSize(17.0)
        
        subView.addSubview(ai)
        subView.addSubview(status)
        
        subView.addConstrainsWithFormat("H:|-30-[v0]-10-[v1]|", views: ai, status)
        subView.addConstrainsWithFormat("V:|[v0]|", views: ai)
        subView.addConstrainsWithFormat("V:|[v0]|", views: status)
        
        
    }
    
}