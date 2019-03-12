//
//  PieChartViewController.swift
//  Shape
//
//  Created by Myunggu Kim on 04/01/2019.
//  Copyright © 2019 myunggukim. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {

    @IBOutlet var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionDraw(_ sender: Any) {
        chartView.drawChart = true
        chartView.setNeedsDisplay()
    }
    
}
