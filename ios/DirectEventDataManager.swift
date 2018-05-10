//
//  DirectEventDataManager.swift
//  meetup
//
//  Created by Michal Mondik on 10/05/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

import React

@objc(DirectEventDataManager)
class DirectEventDataManager: RCTEventEmitter {
  let eventName = "DirectEventData2"

  override func supportedEvents() -> [String]! {
    return [eventName]
  }

  @objc
  func sendData(data: [Int]) {
    self.sendEvent(withName: eventName, body: data)
  }
}
