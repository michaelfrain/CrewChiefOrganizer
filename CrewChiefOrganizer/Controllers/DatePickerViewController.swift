//
//  DatePickerViewController.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 7/2/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UnwindFromDatePickerSegue" {
            let gameSetupController = segue.destination as! GameSetupViewController
            gameSetupController.gameDate = datePicker.date
        }
    }
}
