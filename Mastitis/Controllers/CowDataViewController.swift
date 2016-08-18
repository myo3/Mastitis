//
//  CowDataViewController.swift
//  Mastitis
//
//  Created by Monica Ong on 7/29/16.
//  Copyright © 2016 CS-ECE. All rights reserved.
//

import UIKit
import Charts

class CowDataViewController: UIViewController {
    var barChartView: BarChartView!
    var lineChartView: LineChartView!
    var cowInfoView: UIView!
    
    var cowID: [String] = ["4520", "4521", "4522", "4523", "4524", "4525", "4526", "4527", "4528", "4529", "4530", "4531"]
    let numTimesInfected = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    
    var day = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    let milkProduction = [65, 95, 110, 125, 100, 115, 133, 120, 106, 119, 90, 45]
    
    var tabBarHeight: CGFloat = UITabBarController().tabBar.frame.size.height
    let bounds = UIScreen.mainScreen().bounds
    
    var customRed : UIColor = UIColor(red: 0.98, green: 0.28, blue: 0.26, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        //Make bar chart
        makeBarChart()
        
        //Make line chart
        makeLineChart()
        
        //Make segment control
        makeSegmentedControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeSegmentedControl(){
        let items = ["Infection by Cow", "Milk Production", "Cow Info"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        customSC.frame = CGRectMake(0, 0, bounds.width*0.95, tabBarHeight*0.6)
        customSC.center = CGPointMake(bounds.width/2, tabBarHeight*1.75)
        
        //Style
        customSC.layer.cornerRadius = 5.0
        customSC.backgroundColor = UIColor.whiteColor()
        customSC.tintColor = customRed
        
        customSC.addTarget(self, action: #selector(CowDataViewController.changeView(_:)), forControlEvents: .ValueChanged)
        self.view.addSubview(customSC)
    }
    
    func changeView(sender: UISegmentedControl){
        clearView()
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.addSubview(lineChartView)
        case 2:
            self.view.addSubview(cowInfoView)
        default:
            self.view.addSubview(barChartView)
        }
    }
    
    func clearView(){
        barChartView.removeFromSuperview()
        lineChartView.removeFromSuperview()
        //cowInfoView.removeFromSuperview()
    }
    
    func makeBarChart() {
        self.barChartView = BarChartView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height-3.1*tabBarHeight))
        barChartView.center = CGPointMake(bounds.width/2, bounds.height*0.533)
        setChart(cowID, values: numTimesInfected, caseNum: 0)
        self.view.addSubview(barChartView)
    }
    
    func makeLineChart() {
        self.lineChartView = LineChartView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height-3.1*tabBarHeight))
        lineChartView.center = CGPointMake(bounds.width/2, bounds.height*0.533)
        setChart(cowID, values: numTimesInfected, caseNum: 1)
    }
    
    func setChart(dataPoints: [String], values: [Double], caseNum: Int) {
        //barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        var valueColors = [UIColor] ()
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
            if values[i] > 5{
                valueColors.append(customRed)
            }
            else{
                valueColors.append(UIColor.blackColor())
            }
        }
        
        switch caseNum{
        case 0:
            //Add chart data to bar chart
            let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
            chartDataSet.colors = [customRed]
            chartDataSet.valueColors = valueColors
            
            let chartData = BarChartData(xVals: cowID, dataSet: chartDataSet)
            barChartView.data = chartData
            
            //Customize graph
            barChartView.xAxis.labelPosition = .Bottom
            barChartView.xAxis.setLabelsToSkip(0)
            barChartView.descriptionText = ""
            barChartView.animate(yAxisDuration: 1.5, easingOption: .EaseInOutQuart)
            
            //Disable features
            barChartView.highlighter = nil
            barChartView.legend.enabled = false
            barChartView.rightAxis.enabled = false
            barChartView.xAxis.drawGridLinesEnabled = false
            barChartView.scaleYEnabled = false
            barChartView.scaleXEnabled = false
            barChartView.pinchZoomEnabled = false
            barChartView.doubleTapToZoomEnabled = false
            
            //Left axis displays ints
            barChartView.leftAxis.valueFormatter = NSNumberFormatter()
            barChartView.leftAxis.valueFormatter!.minimumFractionDigits = 0 //no decimals
        case 1:
            //Add chart data to line chart
            let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
            let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
            lineChartView.data = lineChartData
            
            //draw as line
            lineChartDataSet.drawCubicEnabled = true
            //fill graph
            lineChartDataSet.drawFilledEnabled = true
            //color graph
            lineChartDataSet.colors = [customRed]
            
            lineChartView.data = lineChartData
            lineChartView.xAxis.labelPosition = .Bottom
            lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInCubic)
            //remove coordinate circles
            lineChartDataSet.drawCirclesEnabled = false
            //remove xAxis line
            lineChartView.xAxis.drawGridLinesEnabled = false
            lineChartView.xAxis.drawAxisLineEnabled = false
            
            //remove description
            lineChartView.descriptionText = ""
        default:
            break
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
