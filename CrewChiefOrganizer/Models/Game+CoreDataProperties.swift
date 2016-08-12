//
//  Game+CoreDataProperties.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 8/7/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData

extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game");
    }

    @NSManaged public var awayScore: Int16
    @NSManaged public var awayTeam: String?
    @NSManaged public var conference: String?
    @NSManaged public var endDate: Date?
    @NSManaged public var hasOvertime: Bool
    @NSManaged public var hasTelevision: Bool
    @NSManaged public var homeScore: Int16
    @NSManaged public var homeTeam: String?
    @NSManaged public var overtimes: Int16
    @NSManaged public var officials: NSData?
    @NSManaged public var startDate: Date?
    @NSManaged public var plays: Int16
    @NSManaged public var penalties: NSSet?

}

// MARK: Generated accessors for penalties
extension Game {

    @objc(addPenaltiesObject:)
    @NSManaged public func addToPenalties(_ value: Penalty)

    @objc(removePenaltiesObject:)
    @NSManaged public func removeFromPenalties(_ value: Penalty)

    @objc(addPenalties:)
    @NSManaged public func addToPenalties(_ values: NSSet)

    @objc(removePenalties:)
    @NSManaged public func removeFromPenalties(_ values: NSSet)

}
