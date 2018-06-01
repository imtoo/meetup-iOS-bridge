//
//  ChartView.swift
//  meetup
//
//  Created by Michal Mondik on 09/05/2018.
//  Copyright © 2018 Blueberry. All rights reserved.
//

import UIKit
import Charts

class ChartView: UIView {
  var barChartView = BarChartView()
  @objc var xValues: [String] = []
  @objc var yValues: [Double] = []

  override public func layoutSubviews() {
    super.layoutSubviews()
    let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    barChartView.frame = frame

    self.initChart()
  }

  private func initChart() {
    var dataEntries: [BarChartDataEntry] = []

    for i in 0..<yValues.count {
      let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
      dataEntries.append(dataEntry)
    }

    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
    let chartData = BarChartData(dataSet: chartDataSet)
    barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xValues)
    barChartView.data = chartData
    barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    self.addSubview(barChartView)
  }
}
