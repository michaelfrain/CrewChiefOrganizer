//
//  SavedGamesTableViewCell.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 8/12/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

class SavedGamesTableViewCell: UITableViewCell {
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblMatchup: UILabel!
    
    var date: Date? {
        didSet {
            if let date = date {
                let formatter = StaticAssets.dateFormatter
                lblDate.text = formatter.string(from: date)
            } else {
                lblDate.text = ""
            }
        }
    }
    
    var teams: String = "" {
        didSet {
            lblMatchup.text = teams
        }
    }
    
    class func cellForTableView(tableView: UITableView, withDate: Date?, withTeams: String) -> SavedGamesTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedGamesCell") as! SavedGamesTableViewCell
        cell.date = withDate
        cell.teams = withTeams
        
        return cell
    }
}
