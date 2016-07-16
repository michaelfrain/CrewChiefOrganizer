//
//  Game+CoreDataProperties.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 7/16/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData

extension Game {

    @nonobjc class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game");
    }

    @NSManaged var awayScore: Int16
    @NSManaged var awayTeam: String?
    @NSManaged var conference: String?
    @NSManaged var endDate: NSDate?
    @NSManaged var hasOvertime: Bool
    @NSManaged var hasTelevision: Bool
    @NSManaged var homeScore: Int16
    @NSManaged var homeTeam: String?
    @NSManaged var numberOfOvertimes: Int16
    @NSManaged var officials: [String]
    @NSManaged var startDate: NSDate?

}
