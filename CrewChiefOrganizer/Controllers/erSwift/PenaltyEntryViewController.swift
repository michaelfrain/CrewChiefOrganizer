//
//  PenaltyEntryViewController.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 7/3/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

class PenaltyEntryViewController: UIViewController {
    @IBOutlet var pkrTime: UIPickerView!
    @IBOutlet var pkrFoul: UIPickerView!
    @IBOutlet var pkrNumber: UIPickerView!
    var currentGame: Game!

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

extension PenaltyEntryViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case pkrTime:
            return 3
            
        case pkrFoul, pkrNumber:
            return 1
            
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pkrTime:
            switch component {
            case 0:
                return 16
            case 1:
                return 6
            case 2:
                return 10
            default:
                return 0
            }
            
        case pkrFoul:
            return 86
            
        case pkrNumber:
            return 99
            
        default:
            return 0
        }
    }
}

extension PenaltyEntryViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case pkrTime:
            switch component {
            case 0:
                return "\(15 - row)"
            case 1,2:
                return "\(row)"
            default:
                return nil
            }
            
        case pkrFoul:
            return "Foul row \(row)" // TODO: Array for fouls
            
        case pkrNumber:
            return "\(row + 1)"
            
        default:
             return nil
        }
    }
}
