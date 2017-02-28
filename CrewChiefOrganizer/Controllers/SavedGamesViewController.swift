//
//  SavedGamesViewController.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 8/12/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

class SavedGamesViewController: UIViewController {
    var games: [Game]?

    override func viewDidLoad() {
        super.viewDidLoad()
        games = Game.readAllGamesFromMainContext()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResumeSavedGameSegue" {
            guard let index = sender as? IndexPath else {
                // TODO: Handle this rare case
                return
            }
            let destination = segue.destination as! MainEntryViewController
            destination.currentGame = games![index.row]
        }
    }

}

extension SavedGamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let games = games {
            return games.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let games = games {
            let cell = SavedGamesTableViewCell.cellForTableView(tableView, withDate: games[indexPath.row].startDate, withTeams: "\(games[indexPath.row].homeTeam!) vs. \(games[indexPath.row].awayTeam!)") // TODO: Make this type-safe, no forced unwrapping willy-nilly
            return cell
        }
        return UITableViewCell()
    }
}

extension SavedGamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ResumeSavedGameSegue", sender: indexPath)
    }
}
