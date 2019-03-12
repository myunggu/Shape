//
//  ShapeViewController.swift
//  Shape
//
//  Created by Myunggu Kim on 03/01/2019.
//  Copyright © 2019 myunggukim. All rights reserved.
//

import UIKit

class ShapeViewController: UIViewController {

    @IBOutlet var shapingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionRect(_ sender: Any) {
        clear()
        doRectangle()
    }
    
    @IBAction func actionRoundedRect(_ sender: Any) {
        clear()
        doRoundedRectangle()
    }
    
    @IBAction func actionOptionalRoundedRect(_ sender: Any) {
        clear()
        doOptionalRoundedRectangle()
    }
    
    @IBAction func actionTriangle(_ sender: Any) {
        clear()
        doTriangle()
    }
    
    @IBAction func actionOval(_ sender: Any) {
        clear()
        doOval()
    }
    
    @IBAction func actionCircle(_ sender: Any) {
        clear()
        doCircle()
    }
    
    @IBAction func actionArc(_ sender: Any) {
        clear()
        doArc()
    }
    
    @IBAction func actionPie(_ sender: Any) {
        clear()
        doPie()
    }
    
    @IBAction func actionComplexShape() {
        clear()
        doComplexShape()
    }
    
    @IBAction func actionDonut(_ sender: Any) {
        clear()
        doDonut()
    }
    
    func degreeToRadian(_ degree: CGFloat) -> CGFloat {
        return degree * CGFloat(Double.pi) / 180.0
    }
    
    func clear() {
        shapingView.layer.sublayers?.forEach({ (layer) in
            layer.removeFromSuperlayer()
        })
    }
    
    // 직사각형
    func doRectangle() {
    #if false
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 100, height: 100)).cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        canvas.layer.addSublayer(shapeLayer)
    #else
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.close()
    #endif
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 0.5
        shapingView.layer.addSublayer(shapeLayer)
    }
    
    // 모든 모서리가 둥근 사각형
    func doRoundedRectangle() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 200, height: 100), cornerRadius: 10).cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        shapingView.layer.addSublayer(shapeLayer)
    }
    
    // 선택적으로 모서리가 둥근 사각형
    func doOptionalRoundedRectangle() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 200, height: 100),
                                       byRoundingCorners: [.topLeft, .bottomRight],
                                       cornerRadii: CGSize(width: 15.0, height: 0.0)).cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        shapingView.layer.addSublayer(shapeLayer)
    }
    
    // 타원
    func doOval() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 200, height: 100)).cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        shapingView.layer.addSublayer(shapeLayer)
    }
    
    // 원
    func doCircle() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 100, height: 100)).cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        shapingView.layer.addSublayer(shapeLayer)
    }
    
    // 삼각형
    func doTriangle() {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: shapingView.frame.width/2, y: 0.0))
        trianglePath.addLine(to: CGPoint(x: 0.0, y: shapingView.frame.size.height))
        trianglePath.addLine(to: CGPoint(x: shapingView.frame.size.width, y: shapingView.frame.size.height))
        trianglePath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = trianglePath.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 2.0
        shapingView.layer.addSublayer(shapeLayer)
    }
    
    // 호
    func doArc() {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: CGPoint(x: shapingView.bounds.width/2,
                                                          y: shapingView.bounds.height/2),
                                       radius: 100,
                                       startAngle: degreeToRadian(270),
                                       endAngle: degreeToRadian(45),
                                       clockwise: true)
        path.close()
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 2.0
        shapingView.layer.addSublayer(shapeLayer)
    }
    
    // 파이
    func doPie() {
        let center = CGPoint(x: shapingView.bounds.width/2, y: shapingView.bounds.height/2)
        let radius: CGFloat = 80.0
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center,
                    radius: radius,
                    startAngle: degreeToRadian(270),
                    endAngle: degreeToRadian(135),
                    clockwise: true)
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2.0
        shapingView.layer.addSublayer(shapeLayer)
    }
    
    // 도넛
    func doDonut() {
        let centerPoint = CGPoint(x: shapingView.bounds.width/2,
                             y: shapingView.bounds.height/2)
        let radius: CGFloat = 80.0
        let lineWidth: CGFloat = 30.0
        
        // track
        let trackLayer = CAShapeLayer()
        trackLayer.path = UIBezierPath(arcCenter: centerPoint,
                                        radius: radius,
                                        startAngle: 0,
                                        endAngle: degreeToRadian(360), //CGFloat(Double.pi * 2.0),
                                        clockwise: true).cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.white.cgColor
        trackLayer.lineWidth = lineWidth;
        shapingView.layer.addSublayer(trackLayer)
        
        // progress
        let progressLayer = CAShapeLayer()
        progressLayer.path = UIBezierPath(arcCenter: CGPoint(x: shapingView.bounds.width/2, y: shapingView.bounds.height/2),
                                       radius: radius,
                                       startAngle: degreeToRadian(270),
                                       endAngle:degreeToRadian(135),
                                       clockwise: true).cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.red.cgColor
        progressLayer.lineWidth = lineWidth
        progressLayer.lineCap = CAShapeLayerLineCap.round // 양쪽 가장자리를 둥글게 표현
        shapingView.layer.addSublayer(progressLayer)
        
        // add animation to progress
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.add(animation, forKey: nil)
    }
    
    // 복잡한 모양
    func doComplexShape() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: shapingView.frame.size.width/2 - 50.0, y: 0.0))
        path.addArc(withCenter: CGPoint(x: shapingView.frame.size.width/2 - 25.0, y: 25.0),
                    radius: 25.0,
                    startAngle: degreeToRadian(180.0),
                    endAngle: degreeToRadian(0.0),
                    clockwise: false)
        path.addLine(to: CGPoint(x: shapingView.frame.size.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: shapingView.frame.size.width - 50.0, y: 0.0))
        path.addCurve(to: CGPoint(x: shapingView.frame.size.width, y: 50.0),
                      controlPoint1: CGPoint(x: shapingView.frame.size.width + 50.0, y: 25.0),
                      controlPoint2: CGPoint(x: shapingView.frame.size.width - 150.0, y: 50.0))
        path.addLine(to: CGPoint(x: shapingView.frame.size.width, y: shapingView.frame.size.height))
        path.addLine(to: CGPoint(x: 0.0, y: shapingView.frame.size.height))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapingView.backgroundColor = UIColor.orange
        shapingView.layer.mask = shapeLayer
//        shapingView.layer.addSublayer(shapeLayer)
    }

}
