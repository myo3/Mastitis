//
//  CostCalculatorViewController.swift
//  Mastitis
//
//  Created by Monica Ong on 7/29/16.
//  Copyright © 2016 CS-ECE. All rights reserved.
//

import UIKit

class CostCalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        //Set up nav buttons
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Units", style:
            .Plain, target: self, action: #selector(self.toggleUnits))
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .Plain, target: self, action: #selector(self.resetPage))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleUnits(){
        
    }
    
    func resetPage(){
        
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
