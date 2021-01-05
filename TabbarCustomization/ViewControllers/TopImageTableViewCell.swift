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
    let shapeLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ratingView.alpha = 0.0
        shapeLayer.path = getCollapsePath()
        self.topImageView.layer.mask = shapeLayer
        
        maskTopImage()
        presentAnimation()
    }

    func presentAnimation() {
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            self.ratingBarLeftConstraint.constant = 40
            self.ratingBarRightConstraint.constant = 40
            self.ratingView.alpha = 1.0
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func dismissAnimation(completion: @escaping ((Bool) -> Void)) {
        imageCollapseAnimation()
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.ratingBarLeftConstraint.constant = 140
            self.ratingBarRightConstraint.constant = 140
            self.ratingView.alpha = 0.0
            self.layoutIfNeeded()
            
        }, completion: {(sucess) in
            completion(sucess)
        })
    }
    
    func maskTopImage() {
        imageExpandAnimation()
        
        let gradient = CAGradientLayer()
        gradient.frame = self.topImageView.bounds
        gradient.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor,
                           UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor,
                           UIColor.clear.cgColor]
        self.topImageView.layer.addSublayer(gradient)
    }

    func imageExpandAnimation() {
        
        let revealAnimation = CABasicAnimation(keyPath: "path")
        revealAnimation.fromValue = getCollapsePath()
        revealAnimation.toValue = exppansionPath()
        revealAnimation.duration = 0.15
        revealAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        shapeLayer.add(revealAnimation, forKey: nil)
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        shapeLayer.path = exppansionPath()
        CATransaction.commit()
        
    }
    
    func imageCollapseAnimation() {
        let revealAnimation = CABasicAnimation(keyPath: "path")
        revealAnimation.fromValue = exppansionPath()
        revealAnimation.toValue = getCollapsePath()
        revealAnimation.duration = 0.15
        revealAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        shapeLayer.add(revealAnimation, forKey: nil)
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        shapeLayer.path = exppansionPath()
        CATransaction.commit()
    }
    
    func getCollapsePath() -> CGPath {
        return UIBezierPath.init(roundedRect: CGRect(origin: topImageView.frame.origin,
                                                     size: CGSize(width: topImageView.bounds.width,
                                                                  height: topImageView.bounds.height/4)),
                          byRoundingCorners: [.bottomLeft ,.bottomRight],
                          cornerRadii: CGSize(width:50, height:50)).cgPath
    }
    
    func exppansionPath() -> CGPath {
        return UIBezierPath.init(roundedRect: topImageView.bounds,
                                 byRoundingCorners: [.bottomLeft ,.bottomRight],
                                 cornerRadii: CGSize(width:50, height:50)).cgPath
    }
}
