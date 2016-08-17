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
    var cowID: [String]!
    var tabBarHeight: CGFloat = UITabBarController().tabBar.frame.size.height
    let bounds = UIScreen.mainScreen().bounds

    var infectionTimeline : UILabel = UILabel()
    var cowInfo : UILabel = UILabel()
    
    var customRed : UIColor = UIColor(red: 0.98, green: 0.28, blue: 0.26, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view.
        infectionTimeline.text = "Infection by Cow"
        infectionTimeline.frame = CGRectMake(bounds.width/2, bounds.height/2, 200, 21)
        self.view.addSubview(infectionTimeline)
        
        cowInfo.frame = CGRectMake(bounds.width/2, bounds.height/2, 200, 21)
        cowInfo.text = "CowInfo"
        self.view.addSubview(cowInfo)
        
        makeSegControl()
        
        //Make bar chart
        makeBarChart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeSegControl() {
        // Initialize
        let items = ["Infection Timeline", "Infection by Cow", "Cow Info"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        // Set up Frame and SegmentedControl
        customSC.frame = CGRectMake(bounds.minX + 10, bounds.minY + 50,
                                    bounds.width - 20, bounds.height*0.1)
        
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        //customSC.backgroundColor = UIColor.blackColor()
        //customSC.tintColor = UIColor.whiteColor()
        
        // Add target action method
        customSC.addTarget(self, action: "changeDataDisplayed:", forControlEvents: .ValueChanged)
        
        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
    }
    
    /**
     Handler for when custom Segmented Control changes and will change the
     background color of the view depending on the selection.
     */
    func changeDataDisplayed(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            infectionTimeline.hidden = false
            barChartView.hidden = true
            cowInfo.hidden = true
        case 2:
            infectionTimeline.hidden = true
            barChartView.hidden = true
            cowInfo.hidden = false
        default:
            infectionTimeline.hidden = true
            barChartView.hidden = false
            cowInfo.hidden = true
        }
    }
    
    func makeBarChart() {
        self.barChartView = BarChartView(frame: CGRect(x: 0, y: tabBarHeight*1.5, width: bounds.width, height: bounds.height-2.6*tabBarHeight))
        cowID = ["4520", "4521", "4522", "4523", "4524", "4525", "4526", "4527", "4528", "4529", "4530", "4531"]
        let numTimesInfected = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        setChart(cowID, values: numTimesInfected)
        self.view.addSubview(barChartView)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
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
        
        //Add Chart Data
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
