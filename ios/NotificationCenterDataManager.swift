//
//  NotificationCenterDataManager.swift
//  meetup
//
//  Created by Michal Mondik on 10/05/2018.
//  Copyright © 2018 Blueberry. All rights reserved.
//

import React

let notificationName = NSNotification.Name("NotificationCenterDataManager")

@objc(NotificationCenterDataManager)
class NotificationCenterDataManager: RCTEventEmitter {
  let eventName = "NCPeriodicalData"

  override init() {
    super.init()
    NotificationCenter.default.addObserver(self, selector: #selector(self.sendData), name: notificationName, object: nil)
  }

  override func supportedEvents() -> [String]! {
    return [eventName]
  }

  @objc
  func sendData(_ notification: NSNotification) {
    self.sendEvent(withName: eventName, body: notification.userInfo?["data"] as? [String])
  }
}
