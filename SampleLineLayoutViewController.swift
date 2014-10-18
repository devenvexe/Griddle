//
//  SampleLineLayoutViewController.swift
//  Griddle
//
//  Created by Matt Durgavich on 10/17/14.
//  Copyright (c) 2014 WymzeeLabs. All rights reserved.
//

import UIKit

class SampleLineLayoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gridBuilder : () -> UIView =  {
            let ch1 = UIView(frame : CGRect())
            ch1.backgroundColor = UIColor.blueColor()
            
            let spacer = UIView(frame : CGRect())
            spacer.backgroundColor = UIColor.whiteColor()
            
            let ch3 = UIView(frame : CGRect())
            ch3.backgroundColor = UIColor.greenColor()
            
            let ch4 = UIView(frame : CGRect())
            ch4.backgroundColor = UIColor.purpleColor()
            
            let ch5 = UIView(frame : CGRect())
            ch5.backgroundColor = UIColor.orangeColor()
            
            let ch6 = UIView(frame : CGRect())
            ch6.backgroundColor = UIColor.yellowColor()
            
            let h = LineLayout(frame: CGRect())
            h.direction = .Horizontal
            
            let grid = LineLayout(frame:self.view.frame)
            grid.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            grid.addSubview(ch1)
            grid.addSubview(spacer)
            grid.addSubview(ch3)
            
            h.addSubview(ch4)
            h.addSubview(ch5)
            h.addSubview(ch6)
            
            grid.addSubview(h)
            
            return grid
        }
        
        let grid = gridBuilder()
        self.view.addSubview(grid)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[grid]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: ["grid" : grid]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[grid]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: ["grid" : grid]))
    }
}
