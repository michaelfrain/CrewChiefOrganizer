//
//  Game+CoreDataProperties.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 6/18/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData

extension Game {

    @nonobjc class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game");
    }

    @NSManaged var startDate: NSDate?
    @NSManaged var endDate: NSDate?
    @NSManaged var conference: String?
    @NSManaged var homeTeam: String?
    @NSManaged var awayTeam: String?
    @NSManaged var homeScore: Int16
    @NSManaged var awayScore: Int16
    @NSManaged var officials: NSObject?
    @NSManaged var hasOvertime: Bool
    @NSManaged var numberOfOvertimes: Int16
    @NSManaged var hasTelevision: Bool

}
