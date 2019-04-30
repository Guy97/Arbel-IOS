//
//  ActivityTabController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Charts

class ActivityTabController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataEntries: [ChartDataEntry] = []
    
//    var chartDataBeanArray = [ChartDataBean]()

    @IBOutlet weak var showActivity: UIView!
    @IBOutlet weak var activityTableView: UITableView!
//    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var mChart: LineChartView!
    
    
    var activityArray = ["Nome Argomento 1", "Nome Argomento 2", "Nome Argomento 3", "Nome Argomento 4"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(values: [24.0,43.0,56.0,23.0,56.0,68.0,48.0,120.0,41.0])
        
        
        elementStyle()
        
        activityTableView.dataSource = self
        activityTableView.delegate = self
    }
    
    func elementStyle() {
        showActivity.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        showActivity.layer.shadowOffset = CGSize (width: 0, height: 0.5)
        showActivity.layer.shadowRadius = 1.8
        showActivity.layer.shadowOpacity = 0.6
        
        showActivity.layer.cornerRadius = 16
        showActivity.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (activityArray.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let activity = tableView.dequeueReusableCell(withIdentifier: "activity") as! ActivityCell
            activity.argumentName?.text = activityArray[indexPath.row]
            return activity
        }
    
    func setChart(values: [Double]) {
        mChart.noDataText = "Dati non disponibili!"
        for i in 0..<values.count {
            print("chart point : \(values[i])")
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let line1 = LineChartDataSet(entries: dataEntries, label: "Media")
        line1.colors = [NSUIColor.init(red: 208/255, green: 2/255, blue: 27/255, alpha: 0)]
        line1.mode = .cubicBezier
        line1.cubicIntensity = 0.2
        line1.drawCirclesEnabled = false
        line1.drawValuesEnabled = false
        
        let gradient = getGradientFilling()
        line1.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        line1.drawFilledEnabled = true
        
        let months = ["Gen", "Feb", "Mar", "Apr", "Mag", "Giu", "Lug", "Ago", "Set"]
        mChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        mChart.xAxis.granularity = 1
        
        let data = LineChartData()
        data.addDataSet(line1)
        mChart.data = data
        mChart.setScaleEnabled(false)
        mChart.animate(xAxisDuration: 0.3)
        mChart.drawGridBackgroundEnabled = false
        mChart.xAxis.drawAxisLineEnabled = true //X
        mChart.xAxis.drawGridLinesEnabled = false //Y
        mChart.leftAxis.drawAxisLineEnabled = true
        mChart.leftAxis.drawGridLinesEnabled = true
        mChart.rightAxis.drawAxisLineEnabled = true
        mChart.rightAxis.drawGridLinesEnabled = true
        mChart.legend.enabled = false
        mChart.xAxis.enabled = true
        mChart.leftAxis.enabled = true
        mChart.rightAxis.enabled = false
        mChart.xAxis.drawLabelsEnabled = true
        mChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        
//        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
//        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
//        lineChartView.data = lineChartData
    }
    
    /// Creating gradient for filling space under the line chart
    private func getGradientFilling() -> CGGradient {
        // Setting fill gradient color
        let coloTop = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 230/255, green: 155/255, blue: 210/255, alpha: 0).cgColor
        // Colors of the gradient
        let gradientColors = [coloTop, colorBottom] as CFArray
        // Positioning of the gradient
        let colorLocations: [CGFloat] = [0.4, 0.0]
        // Gradient Object
        return CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)!
    }
}

extension ActivityTabController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Attività")
    }
}
