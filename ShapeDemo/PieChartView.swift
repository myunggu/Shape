//
//  PieChartView.swift
//  Shape
//
//  Created by Myunggu Kim on 04/01/2019.
//  Copyright © 2019 myunggukim. All rights reserved.
//

import UIKit

class PieChartView: UIView {
    var drawChart: Bool = false
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        if drawChart {
            drawPieChart()
        }
    }
    
    func drawPieChart() {
        UIView.animate(withDuration: 1.0) {
            let ctx = UIGraphicsGetCurrentContext()
            let center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
            
            ctx?.beginPath()
            ctx?.move(to: center)
            ctx?.setFillColor(UIColor.red.cgColor)
            ctx?.addArc(center: center, radius: 80.0, startAngle: self.degreeToRadian(270), endAngle: self.degreeToRadian(135), clockwise: true)
            ctx?.closePath()
            ctx?.fillPath()
//            ctx?.restoreGState()
        }
        
    }
    

    func degreeToRadian(_ degree: CGFloat) -> CGFloat {
        return degree * CGFloat(Double.pi) / 180.0
    }
}
