//
//  TestEventEmitter.swift
//  meetup
//
//  Created by Michal Mondik on 10/05/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

import React

let eventName2 = "TestEvent"
let data2 = ["Hola1,", "amigo1!", "Que1", "pasa?1"]

@objc(TestEventEmitterManager)
class TestEventEmitterManager: RCTEventEmitter {
  var timer = Timer()

  override func supportedEvents() -> [String]! {
    return [eventName2]
  }

  func scheduleTimeInterval() {
    timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.sendData), userInfo: nil, repeats: true)
  }

  @objc
  func sendData() {
    //    guard self.bridge != nil else { return }
    print("Some data2:")
    self.sendEvent(withName: eventName2, body: data2)
  }
}
