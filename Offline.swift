//
//  Offline.swift
//  
//
//  Created by rene.mtz on 15/04/23.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func applicationWillTerminate(_ application: UIApplication) {
        UserDefaults.standard.set(Int(Date().timeIntervalSince1970), forKey: "lastTimestamp")
        print("Application Terminated")
    }
}
