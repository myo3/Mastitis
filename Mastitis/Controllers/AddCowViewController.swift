//
//  AddCowViewController.swift
//  Mastitis
//
//  Created by Amanda Ong on 8/21/16.
//  Copyright © 2016 CS-ECE. All rights reserved.
//

import UIKit

class AddCowViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var tableView: UITableView  =   UITableView()
    let animals : [String] = ["Dogs","Cats","Mice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavigationBar()
        
        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animals.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = animals [indexPath.row]
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print(animals[indexPath.row])
        
    }
    func donePressed(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func cancelPressed(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
