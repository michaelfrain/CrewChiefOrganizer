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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
            let cell = SavedGamesTableViewCell.cellForTableView(tableView: tableView, withDate: games[indexPath.row].startDate, withTeams: "\(games[indexPath.row].homeTeam!) vs. \(games[indexPath.row].awayTeam!)") // TODO: Make this type-safe, no forced unwrapping willy-nilly
            return cell
        }
        return UITableViewCell()
    }
}

extension SavedGamesViewController: UITableViewDelegate {
    
}
