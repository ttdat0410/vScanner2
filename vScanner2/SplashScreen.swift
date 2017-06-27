//
//  ViewController.swift
//  vScanner2
//
//  Created by DatTran on 6/26/29 H.
//  Copyright © 29 Heisei ANSV. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {

    let logoApp: UIImageView = {

        let iv = UIImageView()
        iv.image = UIImage(named: "ic_ansv")
        iv.contentMode = .ScaleAspectFit
        return iv
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.02, green:0.60, blue:0.47, alpha:1.0)
        
        view.addSubview(logoApp)
        view.addConstrainsWithFormat("H:|[v0]|", views: logoApp)
        view.addConstrainsWithFormat("V:|[v0]|", views: logoApp)

    }


}

