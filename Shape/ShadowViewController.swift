//
//  ShadowViewController.swift
//  Shape
//
//  Created by Myunggu Kim on 18/01/2019.
//  Copyright © 2019 myunggukim. All rights reserved.
//

import UIKit

class ShadowViewController: UIViewController {

    @IBOutlet var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //applySimpleShadow()
        applyCurvedBottomShadow()
    }
    
    
    func applySimpleShadow() {
        //move 5.0 to right-toward and 7.0 point to bottom-toward
        squareView.layer.shadowOffset = CGSize(width: 5.0, height: 7.0)
        squareView.layer.shadowColor = UIColor.black.cgColor
        squareView.layer.shadowRadius = 4.0
        squareView.layer.shadowOpacity = 1.0
        squareView.layer.shadowPath = UIBezierPath(rect: squareView.bounds).cgPath
    }
    
    func applyCurvedBottomShadow() {
        squareView.layer.shadowOffset = CGSize.zero
        squareView.layer.shadowColor = UIColor.black.cgColor
        squareView.layer.shadowRadius = 2.0
        squareView.layer.shadowOpacity = 1.0
        squareView.layer.shadowPath = curvedShadowPath(squareView.bounds)
    }
    
    func curvedShadowPath(_ rect: CGRect) -> CGPath {
        let SHADOWHEIGHT:CGFloat = 15.0
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.size.width, y: 0.0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height + SHADOWHEIGHT))
        path.addCurve(to: CGPoint(x: 0.0, y: rect.size.height + SHADOWHEIGHT),
                      controlPoint1: CGPoint(x: rect.size.width - SHADOWHEIGHT, y: rect.size.height),
                      controlPoint2: CGPoint(x: SHADOWHEIGHT, y: rect.size.height))
        path.close()
        return path.cgPath
    }
    
}
