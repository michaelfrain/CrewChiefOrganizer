//
//  MainEntryViewController.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 8/7/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

class MainEntryViewController: UIViewController {
    @IBOutlet var lblPlayCounter: UILabel!
    var currentGame: Game!
    var playCounter: Int16 = 0 {
        didSet {
            currentGame.plays = playCounter
            lblPlayCounter.text = "Current Play Count: \(playCounter)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        playCounter = currentGame.plays
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func incrementPlayCount(_ sender: UIButton) {
        playCounter += 1
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PenaltyEntrySegue" {
            let destination = segue.destination as! PenaltyEntryViewController
            destination.currentGame = currentGame
        }
        
        if segue.identifier == "ExitAndSaveSegue" {
            do {
                try currentGame.managedObjectContext?.save()
            } catch {
                // TODO: Handle a failed save
            }
        }
    }
    
    @IBAction func unwindToMainEntryViewController(_ sender: UIStoryboardSegue) {
        playCounter += 1
    }

}
