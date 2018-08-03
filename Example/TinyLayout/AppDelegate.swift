//
//  AppDelegate.swift
//  TinyLayout_Example
//
//  Created by LookForward on 07/31/2018.
//  Copyright © 2018 SinetGroup. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = RootVC()
        self.window?.makeKeyAndVisible()
        return true
    }
}
