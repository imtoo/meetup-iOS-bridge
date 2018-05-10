//
//  ChartManager.m
//  meetup
//
//  Created by Michal Mondik on 10/05/2018.
//  Copyright © 2018 Blueberry. All rights reserved.
//

#import <React/RCTViewManager.h>
#import "meetup-Swift.h"

@interface ChartManager: RCTViewManager
@end

@implementation ChartManager

RCT_EXPORT_MODULE()

- (UIView *)view {
  Chart *chart = [[Chart alloc] init];
  return chart;
}

RCT_EXPORT_VIEW_PROPERTY(xValues, NSArray);
RCT_EXPORT_VIEW_PROPERTY(yValues, NSArray);

@end
