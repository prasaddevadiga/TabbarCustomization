//
//  TopImageTableViewCell.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/2/21.
//

import UIKit

class TopImageTableViewCell: UITableViewCell {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var ratingView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        maskTheImage()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath.init(roundedRect: ratingView.bounds,
                                     byRoundingCorners: [.allCorners],
                                     cornerRadii: CGSize(width:50, height:25)).cgPath
//        self.ratingView.layer.masksToBounds = true
//        self.ratingView.layer.mask = shapeLayer
        
        ratingView.layer.shadowColor = UIColor.black.cgColor
        ratingView.layer.shadowOffset = CGSize(width: -0.0, height: -5.0)
        ratingView.layer.shadowOpacity = 0.2
        ratingView.layer.shadowRadius = 15.0
    }

    func maskTheImage() {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.topImageView.bounds
        gradient.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor,
                           UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor,
                           UIColor.clear.cgColor]
        self.topImageView.layer.addSublayer(gradient)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath.init(roundedRect: topImageView.bounds,
                                     byRoundingCorners: [.bottomLeft ,.bottomRight],
                                     cornerRadii: CGSize(width:50, height:25)).cgPath
        self.topImageView.layer.mask = shapeLayer
    }

}
