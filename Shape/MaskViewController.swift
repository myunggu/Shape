//
//  MaskViewController.swift
//  Shape
//
//  Created by Myunggu Kim on 03/01/2019.
//  Copyright © 2019 myunggukim. All rights reserved.
//

import UIKit

class MaskViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // masking
        
        let path = UIBezierPath(arcCenter: CGPoint(x: imageView.frame.size.width/2,
                                               y: imageView.frame.size.height/2),
                            radius: imageView.frame.size.height/2,
                            startAngle: degreeToRadian(130.0),
                            endAngle: degreeToRadian(0.0),
                            clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        imageView.layer.mask = shapeLayer
    }

    func degreeToRadian(_ degree: CGFloat) -> CGFloat {
        return degree * CGFloat(Double.pi) / 180.0
    }
    
}
