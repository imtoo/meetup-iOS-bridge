//
//  DirectEventData.swift
//  meetup
//
//  Created by Michal Mondik on 10/05/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

import React

@objc(DirectEventData)
class DirectEventData: RCTEventEmitter {
  let eventName = "DirectEventData"

  override func supportedEvents() -> [String]! {
    return [eventName]
  }

  @objc
  func sendData(data: [Int]) {
    self.sendEvent(withName: eventName, body: data)
  }
}
