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
  var ncTimer = Timer()
  var dTimer = Timer()

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

    guard let bridge = rootView?.bridge else { return true }

    self.scheduleDirectEvent(bridge: bridge)
    self.scheduleNotificationCenter()

    return true
  }
}

// MARK: - Schedule Notification Center
extension AppDelegate {
  fileprivate func scheduleNotificationCenter() {
    ncTimer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.sendDataNC), userInfo: nil, repeats: true)
  }

  @objc
  fileprivate func sendDataNC() {
    let data = ["Hola,", "amigo!", "Que", "pasa?"]
    NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["data": data])
  }
}

// MARK: - Schedule Direct Event
extension AppDelegate {
  fileprivate func scheduleDirectEvent(bridge: RCTBridge) {
    dTimer = Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(self.sendDataDirect), userInfo: bridge, repeats: true)
  }

  @objc
  fileprivate func sendDataDirect(timer: Timer) {
    guard let bridge = timer.userInfo as? RCTBridge else { return }
    let data = [1, 2, 3, 4, 5]
    let eventManager = DirectEventData()
    eventManager.bridge = bridge // Cannot be set via DI
    eventManager.sendData(data: data)
  }
}
