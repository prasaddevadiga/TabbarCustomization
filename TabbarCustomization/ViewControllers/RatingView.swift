//
//  RatingView.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/3/21.
//

import UIKit

class RatingView: UIView {
    
    var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit()  {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        addSubview(contentView)
        
        contentView.layer.cornerRadius = contentView.frame.height * 0.5
        contentView.layer.masksToBounds = true
        
        self.backgroundColor = .clear
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: -0.0, height: -5.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 15.0
        
    }
    private func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "RatingView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return UIView(frame: .zero)
        }
        return view
    }
}
