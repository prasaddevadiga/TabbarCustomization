//
//  CustomTabbar.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/1/21.
//

import UIKit

@IBDesignable
class CustomTabbar: UITabBar {

    private var shapeLayer: CAShapeLayer?
    
    
    
    
    
//     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createArchPath()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: -0.0, height: -5.0)
        shapeLayer.shadowOpacity = 0.1
        shapeLayer.shadowRadius = 15.0
        
        let squareLayer = CAShapeLayer()
        squareLayer.path = createSquarePath()
        squareLayer.fillColor = UIColor.white.cgColor
        
        if let oldLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
            self.layer.insertSublayer(squareLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 100
        return size
    }
    
    func createSquarePath() -> CGPath {
        let path = UIBezierPath.init(roundedRect: CGRect(x: self.bounds.origin.x, y: self.bounds.height/2-10, width: self.bounds.width, height: self.bounds.height),
                                      byRoundingCorners: UIRectCorner(rawValue: UInt(0.0)),
                                      cornerRadii: CGSize(width: self.bounds.width, height: self.bounds.height))
        return path.cgPath
    }
    
    func createArchPath() -> CGPath {
        let path = UIBezierPath.init(roundedRect: CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y - 10, width: self.bounds.width, height: self.bounds.height),
                                      byRoundingCorners: UIRectCorner(rawValue: UInt(22.0)),
                                      cornerRadii: CGSize(width: self.bounds.width, height: self.bounds.height))
        return path.cgPath
        
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 30, y: 10))
//        path.addLine(to: CGPoint(x: self.frame.width-30, y: 10))
//        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
//        path.addLine(to: CGPoint(x: 0 , y: self.frame.height))
//        path.close()
//        return path.cgPath

    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth: CGFloat = self.frame.size.width/2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height * 2) , y: 0))
        
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0),
                      controlPoint2: CGPoint(x: centerWidth-35, y: height))
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y:0),
                      controlPoint1: CGPoint(x: centerWidth + 35, y: height),
                      controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0 , y: self.frame.height))
        path.close()
        return path.cgPath
    }
}
