//
//  AppDelegate.swift
//  meetup
//
//  Created by Michal Mondik on 08/05/2018.
//  Copyright © 2018 Blueberry. All rights reserved.
//

import NotificationCenter
import UIKit
import React

// Constants
private let bundlePath = "index"
private let moduleName = "meetup"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    // Location of the JS bundle
    let jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: bundlePath, fallbackResource: nil)

    // Root view init
    let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: moduleName, initialProperties: nil, launchOptions: launchOptions)
    rootView?.backgroundColor = UIColor.white

    // Root viewController init
    let rootViewController = UIViewController()
    rootViewController.view = rootView

    // Window init
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = rootViewController
    self.window?.makeKeyAndVisible()

//    self.scheduleNotificationCenter()

    return true
  }
}

// MARK: - Schedule Notification Center
extension AppDelegate {
  fileprivate func scheduleNotificationCenter() {
    _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.sendDataNC), userInfo: nil, repeats: true)
  }

  @objc
  fileprivate func sendDataNC() {
    let data = ["Hola,", "amigo!", "Que", "pasa?"]
    NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["data": data])
  }
}
