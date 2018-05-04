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

    return true
  }
}
