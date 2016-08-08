//
//  Penalty+CoreDataProperties.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 8/7/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData

extension Penalty {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Penalty> {
        return NSFetchRequest<Penalty>(entityName: "Penalty");
    }

    @NSManaged public var foul: String?
    @NSManaged public var foulingSide: Int16
    @NSManaged public var isHomeTeam: Bool
    @NSManaged public var officials: NSData?
    @NSManaged public var playerNumber: Int16
    @NSManaged public var quarter: Int16
    @NSManaged public var result: Int16
    @NSManaged public var timeRemaining: Int16
    @NSManaged public var playNumber: Int16
    @NSManaged public var game: Game?

}
