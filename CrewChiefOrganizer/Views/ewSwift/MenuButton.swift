//
//  MenuButton.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 6/18/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

@IBDesignable class MenuButton: UIButton {
    @IBInspectable var borderColor: UIColor! {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
