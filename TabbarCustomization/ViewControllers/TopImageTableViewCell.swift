//
//  TopImageTableViewCell.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/2/21.
//

import UIKit

class TopImageTableViewCell: UITableViewCell {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var ratingBarRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var ratingBarLeftConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        maskTopImage()
        presentAnimation()
    }

    func presentAnimation() {
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            self.ratingBarLeftConstraint.constant = 40
            self.ratingBarRightConstraint.constant = 40
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func dismissAnimation(completion: @escaping ((Bool) -> Void)) {
        
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseIn, animations: {
            self.ratingBarLeftConstraint.constant = 140
            self.ratingBarRightConstraint.constant = 140
            self.layoutIfNeeded()
        }, completion: {(sucess) in
            completion(sucess)
        })
    }
    
    func maskTopImage() {
        
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
