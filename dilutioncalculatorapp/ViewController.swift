//
//  ViewController.swift
//  dilutioncalculatorapp
//
//  Created by Benjamin Joye on 5/16/18.
//  Copyright © 2018 Benjamin Joye. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    

    @IBOutlet weak var field250: NSTextField!
    @IBOutlet weak var field500: NSTextField!
    @IBOutlet weak var field750: NSTextField!
    @IBOutlet weak var field150000: NSTextField!
    @IBOutlet weak var cellCountField: NSTextField!
    
    @IBOutlet weak var bd1: NSTextField!
    @IBOutlet weak var bd2: NSTextField!
    
    @IBOutlet weak var d1501: NSTextField!
    @IBOutlet weak var d1502: NSTextField!
    
    @IBOutlet weak var d2501: NSTextField!
    @IBOutlet weak var d2502: NSTextField!
    
    @IBOutlet weak var d5001: NSTextField!
    @IBOutlet weak var d5002: NSTextField!
    
    @IBOutlet weak var d7501: NSTextField!
    @IBOutlet weak var d7502: NSTextField!

    
    @IBAction func calculateButton(_ sender: Any) {
        
        let cellCount = Int32(cellCountField.intValue)
        let of250 = field250.intValue
        let of500 = field500.intValue
        let of750 = field750.intValue
        let of150000 = field150000.intValue
    
        var f250 = of250
        var f500 = of500
        var f750 = of750
        let f150000 = Double(of150000)
        
        let factor = Double(cellCount) / 10000000.0
        
        var even = false
        
        while (even == false) {
            f250 += 1
            if ((f250%30) == 0) {
                if (((f250*20)%30) == 0) {
                    even = true
                }
            }
        }
        
        even = false
        
        while (even == false) {
            f500 += 1
            if ((f500%50) == 0) {
                if (((f500*40)%50) == 0) {
                    even = true
                }
            }
        }
        
        even = false
        
        while (even == false) {
            f750 += 1
            if ((f750%70) == 0) {
                if (((f750*60)%70) == 0) {
                    even = true
                }
            }
        }
        
        even = false
        
        let b250 = f250 / 3
        let b500 = f500 / 5
        let b750 = f750 / 7
        var totalBase = Double(b250 + b500 + b750)
        totalBase = totalBase * 1.05
        
        let algaeVolume = round(Double(totalBase) / (factor + 1))
        

        let baseDilution = round(algaeVolume * factor)
        
        let d250 = b250 * 2
        let d500 = b500 * 4
        let d750 = b750 * 6
        
        let newFactor = Double(cellCount / 150000)

        let newAlgaeVolume = round(f150000 / (newFactor + 1))
        let d150000 = round(newAlgaeVolume * newFactor)
        
        bd1.doubleValue = Double(algaeVolume)
        bd2.doubleValue = Double(baseDilution)
        
        d1501.doubleValue = Double(newAlgaeVolume)
        d1502.doubleValue = Double(d150000)
        
        d2501.doubleValue = Double(b250)
        d2502.doubleValue = Double(d250)
        
        d5001.doubleValue = Double(b500)
        d5002.doubleValue = Double(d500)
        
        d7501.doubleValue = Double(b750)
        d7502.doubleValue = Double(d750)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

