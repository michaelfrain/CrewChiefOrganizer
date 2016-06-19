//
//  MenuButton.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 6/18/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

@IBDesignable class MenuButton: UIButton {
    @IBInspectable var topColor: UIColor! {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable var bottomColor: UIColor! {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [Float(0), Float(1)]
        gradientLayer.cornerRadius = cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
