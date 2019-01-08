//
//  DrawingView.swift
//  Shape
//
//  Created by Myunggu Kim on 03/01/2019.
//  Copyright © 2019 myunggukim. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    override func draw(_ rect: CGRect) {
//        let path: UIBezierPath = createOval()
        let path: UIBezierPath = createTriangle()
//        let path: UIBezierPath = createCircle()
        
        
        UIColor.orange.setFill()
        path.fill()
        
        UIColor.purple.setStroke()
        path.stroke()
    }
    
    
    // 타원
    func createOval() -> UIBezierPath {
        let path = UIBezierPath(ovalIn: self.bounds)
        return path
    }
    
    // 원
    func createCircle() -> UIBezierPath {
        let path = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 100, height: 100))
        return path
    }
    
    // 삼각형
    func createTriangle() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
        return path
    }
    
    // 사각형
    func createRectangle() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.close()
        return path
    }
    
    // 모든 모서리가 둥근 사각형
    func createRoundedRectangle() -> UIBezierPath {
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 30.0)
        return path
    }
    
    // 선택적으로 모서리가 둥근 사각형
    func createOptionalRoundedRectangle() -> UIBezierPath {
        // cornerRadii : just the width is taken into account; the height is just disregarded.
        let path = UIBezierPath(roundedRect: self.bounds,
                            byRoundingCorners: [.topLeft, .bottomRight],
                            cornerRadii: CGSize(width: 30.0, height: 0.0))
        return path
    }
    
    // 호
    func createArc() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
                                radius: 50,
                                startAngle: degreeToRadian(180.0),
                                endAngle: degreeToRadian(0.0),
                                clockwise: true)
        return path
    }
    
    // 각도 -> 라디안
    func degreeToRadian(_ degree: CGFloat) -> CGFloat {
        return degree * CGFloat(Double.pi) / 180.0
    }

}



