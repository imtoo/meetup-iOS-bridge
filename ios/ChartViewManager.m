//
//  ChartViewManager.m
//  meetup
//
//  Created by Michal Mondik on 14/05/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <React/RCTViewManager.h>
#import "meetup-Swift.h"

@interface ChartViewManager: RCTViewManager
@end

@implementation ChartViewManager
RCT_EXPORT_MODULE()

- (UIView *) view {
  ChartView *view = [[ChartView alloc] init];
  return view;
}

RCT_EXPORT_VIEW_PROPERTY(xValues, NSArray)
RCT_EXPORT_VIEW_PROPERTY(yValues, NSArray)

@end
