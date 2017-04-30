//
//  KeypadEntry.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 4/29/17.
//  Copyright © 2017 Michael Frain. All rights reserved.
//

import UIKit

@IBDesignable
class KeypadEntry: UIView {
    var delegate: KeypadEntryDelegate?

    @IBAction func keypadEntry(button: MenuButton) {
        var buttonInput = 0
        if let title = button.titleLabel,
            let text = title.text,
            let number = Int(text)
        {
            if text == "C" {
                delegate?.didDeleteLastNumber(keypadEntry: self)
                return
            }
            buttonInput = number
        }
        delegate?.didInputToKeypad(keypadEntry: self, input: buttonInput)
    }
}

protocol KeypadEntryDelegate {
    func didInputToKeypad(keypadEntry: KeypadEntry, input: Int)
    func didDeleteLastNumber(keypadEntry: KeypadEntry)
}
