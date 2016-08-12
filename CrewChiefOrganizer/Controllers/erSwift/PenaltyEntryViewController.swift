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
    
    @IBOutlet var segFoulingSide: UISegmentedControl!
    @IBOutlet var segQuarter: UISegmentedControl!
    @IBOutlet var segTeam: UISegmentedControl!
    @IBOutlet var segChoice: UISegmentedControl!
    @IBOutlet var segOfficial: UISegmentedControl!
    var currentGame: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
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
            
            let timeArray: [Int] = [15 - pkrTime.selectedRow(inComponent: 0),pkrTime.selectedRow(inComponent: 1),pkrTime.selectedRow(inComponent: 2)]
            let rawTime = Int16((timeArray[0] * 60) + (timeArray[1] * 10) + timeArray[2])
            penalty.timeRemaining = rawTime
            
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
            return "\(StaticAssets.penalties[row])" // TODO: Array for fouls
            
        case pkrNumber:
            return "\(row + 1)"
            
        default:
             return nil
        }
    }
}
