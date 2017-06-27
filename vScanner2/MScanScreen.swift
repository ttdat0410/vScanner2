//
//  MScanScreen.swift
//  vScanner2
//
//  Created by DatTran on 6/26/29 H.
//  Copyright © 29 Heisei ANSV. All rights reserved.
//

import Foundation
import UIKit

class MScanScreen: NSObject {
    
    private var _deviceId       : String?
    private var _deviceName     : String?
    private var _deviceBattery  : String?
    private var _rssiTxt        : String?
    private var _sensor1Txt     : String?
    
    init(deviceId: String, deviceName: String, deviceBattery: String, rssi: String, sensorTxt: String) {
        
        self._deviceId          = deviceId
        self._deviceName        = deviceName
        self._deviceBattery     = deviceBattery
        self._rssiTxt           = rssi
        self._sensor1Txt        = sensorTxt
        
    }
    
    var deviceId: String! {
    
        get{
            return self._deviceId
        }
        set{
            self._deviceId = newValue
        }
    
    }
    
    var deviceName: String! {
        
        get{
            return self._deviceName
        }
        set{
            self._deviceName = newValue
        }
        
    }
    
    var deviceBattery: String! {
        
        get{
            return self._deviceBattery
        }
        set{
            self._deviceBattery = newValue
        }
        
    }
    
    var rssi: String! {
        
        get{
            return self._rssiTxt
        }
        set{
            self._rssiTxt = newValue
        }
        
    }
    
    var sensor1Txt: String! {
        
        get{
            return self._sensor1Txt
        }
        set{
            self._sensor1Txt = newValue
        }
        
    }
    
}