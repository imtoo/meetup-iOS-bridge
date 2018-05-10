//
//  PeriodicalData.swift
//  meetup
//
//  Created by Michal Mondik on 10/05/2018.
//  Copyright © 2018 Blueberry. All rights reserved.
//

import React

let eventName = "PeriodicalData"
let data = ["Hola,", "amigo!", "Que", "pasa?"]

@objc(PeriodicalDataManager)
class PeriodicalDataManager: RCTEventEmitter {
  var timer = Timer()

//  init() {
//    self.scheduleTimeInterval()
//  }

//  init(bridge: RCTBridge) {
////    self.bridge = bridge
////    self.scheduleTimeInterval()
//  }

  override init() {
    super.init()
    NotificationCenter.default.addObserver(self, selector: #selector(self.sendData), name: NSNotification.Name("hello"), object: nil)
  }

  override func supportedEvents() -> [String]! {
    return [eventName]
  }

  func scheduleTimeInterval() {
    timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.sendData), userInfo: nil, repeats: true)
  }

  @objc
  func sendData() {
//    guard self.bridge != nil else { return }
    print("Some data:")
    let data2 = ["Hola,", "amigo!", "Que", "pasa?"]
    self.sendEvent(withName: eventName, body: data2)
  }
}
