//
//  TableViewCell.swift
//  Mastitis
//
//  Created by Amanda Ong on 9/25/16.
//  Copyright © 2016 CS-ECE. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var cellLabel: UILabel!
    var cellTextView: UITextView!
    let cellHeight:CGFloat = 43.5
    let bounds2 = UIScreen.mainScreen().bounds

    let addCowVC:AddCowViewController = AddCowViewController()

    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cellLabel = UILabel(frame: CGRectMake(bounds.width*0.05, 0, bounds.width*0.75, cellHeight))
        cellLabel.center.y = cellHeight*0.5
        cellLabel.textColor = UIColor(red: 118/255, green: 118/255, blue: 118/255, alpha: 1)
        
        
        cellTextView = UITextView(frame: CGRectMake(0, 0, bounds2.width*0.86, cellHeight))
        cellTextView.center.y = cellHeight*0.555
        cellTextView.center.x = bounds2.width*0.54
        cellTextView.textAlignment = NSTextAlignment.Right
        cellTextView.font = UIFont.systemFontOfSize(18)
        cellTextView.autocorrectionType = UITextAutocorrectionType.No
        cellTextView.keyboardType = UIKeyboardType.NumberPad
        cellTextView.returnKeyType = UIReturnKeyType.Done
        cellTextView.becomeFirstResponder()
        cellTextView.delegate = addCowVC
        
        cellTextView.scrollEnabled = false
        cellTextView.backgroundColor = UIColor.clearColor()
        
        self.addSubview(cellLabel)
        self.addSubview(cellTextView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.cellTextView.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.cellTextView.resignFirstResponder()
        return true
    }

}