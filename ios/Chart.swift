import UIKit
import Charts

@objc
class Chart: UIView {
  var barChartView = BarChartView()
  var xValues: [String] = []
  var yValues: [Double] = []

  override public func layoutSubviews() {
    super.layoutSubviews()
    let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    barChartView.frame = frame

    self.initChart()
  }

  @objc
  func setXValues(_ values: NSArray) {
    guard let array: [String] = values as? [String] else { return }

    xValues = array
  }

  @objc
  func setYValues(_ values: NSArray) {
    guard let array: [Double] = values as? [Double] else { return }

    yValues = array
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
