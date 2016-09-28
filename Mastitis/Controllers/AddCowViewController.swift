//
//  AddCowViewController.swift
//  Mastitis
//
//  Created by Amanda Ong on 8/21/16.
//  Copyright © 2016 CS-ECE. All rights reserved.
//

import UIKit

class AddCowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    let bounds = UIScreen.mainScreen().bounds
    var cowInfotableView: UITableView  =   UITableView()
    let cellLabels : [String] = ["ID","Number of Times Infected"]
    let cellHeight:CGFloat = 43.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavigationBar()
        makeCowInfoTableView()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeNavigationBar(){
        self.view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1)
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(donePressed(_:)))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(cancelPressed(_:)))
        
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.title = "Add Cow"
    }
    
    func donePressed(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func cancelPressed(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func makeCowInfoTableView(){
        cowInfotableView = UITableView(frame: CGRectMake(0, 0, bounds.width, bounds.height*0.13), style: UITableViewStyle.Plain)
        self.automaticallyAdjustsScrollViewInsets = false
        cowInfotableView.scrollEnabled = false
        cowInfotableView.center = CGPointMake(bounds.width/2, bounds.height*0.22)
        cowInfotableView.delegate      =   self
        cowInfotableView.dataSource    =   self
        cowInfotableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.cowInfotableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellLabels.count
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = TableViewCell(frame: CGRectMake(0, 0, self.view.frame.width, CGFloat(cellHeight)), title: cellLabels[indexPath.row])
        cell.cellLabel.text = cellLabels [indexPath.row]
        if (indexPath.row==1){
            cell.cellTextView.frame.size.width = bounds.width*0.38
            cell.cellTextView.center.x = bounds.width*0.78
        }
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print(cellLabels[indexPath.row])
        
    }
}
