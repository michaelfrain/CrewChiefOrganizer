//
//  GameSetupViewController.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 6/19/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

class GameSetupViewController: UIViewController {
    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var txtGameDate: SetupTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GameSetupViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtGameDate {
            performSegue(withIdentifier: "DatePickerSegue", sender: self)
            return false
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if traitCollection.verticalSizeClass == .compact {
            topConstraint.constant = textField.frame.origin.y * -1
            UIView.animate(withDuration: 1.0) { 
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        topConstraint.constant = 0
        UIView.animate(withDuration: 1.0) { 
            self.view.layoutIfNeeded()
        }
    }
}
