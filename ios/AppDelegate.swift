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
  var timer = Timer()

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

    self.scheduleTimeInterval()

    return true
  }

  @objc func kua() {
    PeriodicalDataManager().sendData()
  }

  func scheduleTimeInterval() {
    timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.sendData), userInfo: nil, repeats: true)
  }

  @objc
  private func sendData() {
    NotificationCenter.default.post(name: NSNotification.Name("hello"), object: "some data")
  }
}
