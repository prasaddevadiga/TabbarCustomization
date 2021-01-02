//
//  CustomTabbar.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/1/21.
//

import UIKit

let tabBarHeight: CGFloat = 100.0

@IBDesignable
class CustomTabbar: UITabBar {

    private var shapeLayer: CAShapeLayer?
    
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
        
        if let oldLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = tabBarHeight
        return size
    }
    
    func createArchPath() -> CGPath {
        let path = UIBezierPath.init(roundedRect: self.bounds,
                                     byRoundingCorners: [.topLeft ,.topRight],
                                      cornerRadii: CGSize(width:tabBarHeight/2, height:tabBarHeight/2))
        return path.cgPath
    }
}
