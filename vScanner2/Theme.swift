//
//  Theme.swift
//  vScanner2
//
//  Created by DatTran on 6/27/29 H.
//  Copyright © 29 Heisei ANSV. All rights reserved.
//

import Foundation
import UIKit

enum Theme: Int {
    
    case light, dark, graphical
    
    private enum Keys {
        
        static let selectedTheme = "SelectedTheme"
        
    }
    
    static var current: Theme {
        
        let storedTheme = NSUserDefaults.standardUserDefaults().integerForKey(Keys.selectedTheme)
        return Theme(rawValue: storedTheme) ?? .light
        
    }
    
    var mainColor: UIColor {
        
        switch self {
        case .light:
            return UIColor.redColor()
        case .dark:
            return UIColor.darkGrayColor()
        case .graphical:
            return UIColor.orangeColor()
        default:
            return UIColor.lightGrayColor()
        }
        
    }
    
    var barStyle: UIBarStyle {
        switch self {
        case .light, .graphical:
        return .Default
        case .dark:
            return .Black
        }
    }
    
    var navigationBackgroundImage: UIImage? {
        return self == .graphical ? UIImage(named: "navBackground") : nil
    }
    
    var tabBarBackgroundImage: UIImage? {
        return self == .graphical ? UIImage(named: "tabBarBackground") : nil
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .light, .graphical:
        return UIColor.whiteColor()
        case .dark:
            return UIColor(white: 0.4, alpha: 1.0)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .light, .graphical:
        return UIColor.blackColor()
        case .dark:
            return UIColor.whiteColor()
        }
    }
    
    func apply() {
        NSUserDefaults.standardUserDefaults().setValue(rawValue, forKeyPath: Keys.selectedTheme)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        UIApplication.sharedApplication().delegate?.window??.tintColor = mainColor
        
        UINavigationBar.appearance().barStyle = barStyle
        UINavigationBar.appearance().setBackgroundImage(navigationBackgroundImage, forBarMetrics: .Default)
        
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "backArrow")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMaskFixed")
        UITabBar.appearance().barStyle = barStyle
        UITabBar.appearance().backgroundImage = tabBarBackgroundImage
        
        let tabIndicator = UIImage(named: "tabBarSelectionIndicator")?.imageWithRenderingMode(.AlwaysTemplate)
        
        let tabResizableIndicator = tabIndicator?.resizableImageWithCapInsets(UIEdgeInsets(top: 0, left: 2.0, bottom: 0, right: 2.0))
        
        UITabBar.appearance().selectionIndicatorImage = tabResizableIndicator
        
        let controlBackground = UIImage(named: "controlBackground")?.imageWithRenderingMode(.AlwaysTemplate).resizableImageWithCapInsets(UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        let controlSelectedBackground = UIImage(named: "controlSelectedBackground")?.imageWithRenderingMode(.AlwaysTemplate).resizableImageWithCapInsets(UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        UISegmentedControl.appearance().setBackgroundImage(controlBackground, forState: .Normal, barMetrics: .Default)
        UISegmentedControl.appearance().setBackgroundImage(controlSelectedBackground, forState: .Selected, barMetrics: .Default)
        
        UIStepper.appearance().setBackgroundImage(controlBackground, forState: .Normal)
        UIStepper.appearance().setBackgroundImage(controlBackground, forState: .Disabled)
        UIStepper.appearance().setBackgroundImage(controlBackground, forState: .Highlighted)
        UIStepper.appearance().setDecrementImage(UIImage(named: "fewerPaws"), forState: .Normal)
        UIStepper.appearance().setIncrementImage(UIImage(named: "morePaws"), forState: .Normal)
        
        UISlider.appearance().setThumbImage(UIImage(named: "sliderThumb"), forState: .Normal)
//        UISlider.appearance().setMaximumTrackImage(UIImage(named: "maximumTrack")?.rend
//            .resizableImage(withCapInsets:UIEdgeInsets(top: 0, left: 0.0, bottom: 0, right: 6.0)), forState: .Normal)
//        
//        UISlider.appearance().setMinimumTrackImage(UIImage(named: "minimumTrack")?
//            .withRenderingMode(.alwaysTemplate)
//            .resizableImage(withCapInsets:UIEdgeInsets(top: 0, left: 6.0, bottom: 0, right: 0)), for: .normal)
        
        UISwitch.appearance().onTintColor = mainColor.colorWithAlphaComponent(0.3)
        UISwitch.appearance().thumbTintColor = mainColor
        
        UITableViewCell.appearance().backgroundColor = backgroundColor
//        UILabel.appearanceForTraitCollection(UITraitCollection, whenContainedInInstancesOfClasses: [UITableViewCell.self]).textColor = textColor
        
    }
}