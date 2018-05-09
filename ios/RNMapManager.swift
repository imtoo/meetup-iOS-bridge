import MapKit
import React

@objc(RNMapManager)
class RNMapManager: RCTViewManager {
  override func view() -> UIView! {
    return MKMapView()
  }
}
