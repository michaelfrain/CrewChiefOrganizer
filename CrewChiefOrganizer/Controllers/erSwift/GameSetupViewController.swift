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
    @IBOutlet var txtHomeTeam: SetupTextField!
    @IBOutlet var txtAwayTeam: SetupTextField!
    @IBOutlet var txtReferee: SetupTextField!
    @IBOutlet var txtUmpire: SetupTextField!
    @IBOutlet var txtLinesman: SetupTextField!
    @IBOutlet var txtLineJudge: SetupTextField!
    @IBOutlet var txtFieldJudge: SetupTextField!
    @IBOutlet var txtSideJudge: SetupTextField!
    @IBOutlet var txtBackJudge: SetupTextField!
    @IBOutlet var txtCenterJudge: SetupTextField!
    
    var gameDate: Date?

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
        if segue.identifier == "MainGameSegue" {
            let newGame = Game.createGameInMainContext()
            newGame.startDate = gameDate
            newGame.homeTeam = txtHomeTeam.text!
            newGame.awayTeam = txtAwayTeam.text!
            let officials = [txtReferee.text!,
                                 txtUmpire.text!,
                                 txtLinesman.text!,
                                 txtLineJudge.text!,
                                 txtFieldJudge.text!,
                                 txtSideJudge.text!,
                                 txtBackJudge.text!,
                                 txtCenterJudge.text!]
            newGame.officials = NSKeyedArchiver.archivedData(withRootObject: officials)
            
            do {
                let delegate = UIApplication.shared.delegate as! AppDelegate
                let moc = delegate.persistentContainer.viewContext
                try moc.save()
                
                let destination = segue.destination as! MainEntryViewController
                destination.currentGame = newGame
            } catch {
                // TODO: Handle a failed save
            }
        }
    }
    
    @IBAction func unwindToGameSetupViewController(sender: UIStoryboardSegue) {
        if sender.identifier == "UnwindFromDatePickerSegue" {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            let formattedDate = dateFormatter.string(from: gameDate!)
            txtGameDate.text = formattedDate
        }
    }
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
