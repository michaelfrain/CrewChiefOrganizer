//
//  PenaltyEntryViewController.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 7/3/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

class PenaltyEntryViewController: UIViewController {
    @IBOutlet var keypadTime: UIView!
    @IBOutlet var pkrFoul: UIPickerView!
    @IBOutlet var pkrNumber: UIPickerView!
    
    @IBOutlet var segFoulingSide: UISegmentedControl!
    @IBOutlet var segQuarter: UISegmentedControl!
    @IBOutlet var segTeam: UISegmentedControl!
    @IBOutlet var segChoice: UISegmentedControl!
    @IBOutlet var segOfficial: UISegmentedControl!
    
    @IBOutlet var txtTimeFirstDigit: UITextField!
    @IBOutlet var txtTimeSecondDigit: UITextField!
    @IBOutlet var txtTimeThirdDigit: UITextField!
    @IBOutlet var txtTimeFourthDigit: UITextField!
    var currentGame: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        let keypadEntryNib = Bundle.main.loadNibNamed("KeypadEntry", owner: self, options: nil)?.first as! KeypadEntry
        keypadTime.addSubview(keypadEntryNib)
        
        let top = NSLayoutConstraint(item: keypadTime, attribute: .top, relatedBy: .equal, toItem: keypadEntryNib, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: keypadTime, attribute: .bottom, relatedBy: .equal, toItem: keypadEntryNib, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let leading = NSLayoutConstraint(item: keypadTime, attribute: .leading, relatedBy: .equal, toItem: keypadEntryNib, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailing = NSLayoutConstraint(item: keypadTime, attribute: .trailing, relatedBy: .equal, toItem: keypadEntryNib, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        keypadEntryNib.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([top, bottom, leading, trailing])
        keypadEntryNib.delegate = self
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindMainEntrySegue" {
            let penalty = Penalty.createPenaltyInMainContext()
            
            let foulRow = pkrFoul.selectedRow(inComponent: 0)
            penalty.foul = StaticAssets.penalties[foulRow]
            
            let foulingSide = StaticAssets.FoulingSide(rawValue: Int16(segFoulingSide.selectedSegmentIndex))
            penalty.foulingSide = Int16(foulingSide!.hashValue)
            
            if segTeam.selectedSegmentIndex == 0 {
                penalty.isHomeTeam = true
            } else {
                penalty.isHomeTeam = false
            }
            
            var officials: [String] = []
            officials.append(StaticAssets.officials[segOfficial.selectedSegmentIndex])
            let offData = NSKeyedArchiver.archivedData(withRootObject: officials)
            penalty.officials = offData
            
            penalty.playNumber = pkrNumber.selectedRow(inComponent: 0) + 1
            
            penalty.quarter = segQuarter.selectedSegmentIndex + 1
            
            let result = StaticAssets.Result(rawValue: Int16(segChoice.selectedSegmentIndex))
            penalty.result = Int16(result!.hashValue)
            
            penalty.playNumber = currentGame.plays
            
            penalty.game = currentGame
            currentGame.addToPenalties(penalty)
            
            do {
                let delegate = UIApplication.shared.delegate as! AppDelegate
                let moc = delegate.persistentContainer.viewContext
                try moc.save()
            } catch {
                // TODO: Handle a failed save
            }
        }
    }

    @IBAction func cancelPenaltyEntry(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension PenaltyEntryViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case pkrFoul, pkrNumber:
            return 1
            
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pkrFoul:
            return StaticAssets.penalties.count
            
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
        case pkrFoul:
            return "\(StaticAssets.penalties[row])" // TODO: Array for fouls
            
        case pkrNumber:
            return "\(row + 1)"
            
        default:
             return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch pickerView {
        default:
            return 100
        }
    }
}

extension PenaltyEntryViewController: KeypadEntryDelegate {
    func didInputToKeypad(keypadEntry: KeypadEntry, input: Int) {
        if keypadEntry == keypadTime.subviews[0] as! KeypadEntry {
            if txtTimeFirstDigit.text == "" {
                if input == 0 || input == 1 {
                    txtTimeFirstDigit.text = "\(input)"
                } else {
                    txtTimeFirstDigit.text = "\(0)"
                    txtTimeSecondDigit.text = "\(input)"
                }
            } else if txtTimeSecondDigit.text == "" {
                if txtTimeFirstDigit.text == "0" {
                    txtTimeSecondDigit.text = "\(input)"
                } else {
                    if input <= 5 {
                        txtTimeSecondDigit.text = "\(input)"
                    }
                }
            } else if txtTimeThirdDigit.text == "" {
                if input <= 5 {
                    txtTimeThirdDigit.text = "\(input)"
                }
            } else if txtTimeFourthDigit.text == "" {
                txtTimeFourthDigit.text = "\(input)"
            }
        }
    }
    
    func didDeleteLastNumber(keypadEntry: KeypadEntry) {
        if txtTimeFourthDigit.text != "" {
            txtTimeFourthDigit.text = ""
        } else if txtTimeThirdDigit.text != "" {
            txtTimeThirdDigit.text = ""
        } else if txtTimeSecondDigit.text != "" {
            txtTimeSecondDigit.text = ""
        } else if txtTimeFirstDigit.text != "" {
            txtTimeFirstDigit.text = ""
        }
    }
}
