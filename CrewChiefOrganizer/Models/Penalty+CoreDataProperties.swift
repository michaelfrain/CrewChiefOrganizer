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

    @nonobjc open override class func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<Penalty>(entityName: "Penalty") as! NSFetchRequest<NSFetchRequestResult>;
    }

    @NSManaged public var foul: String?
    @NSManaged public var foulingSide: Int16
    @NSManaged public var isHomeTeam: Bool
    @NSManaged public var officials: Data?
    @NSManaged public var playerNumber: Int16
    @NSManaged public var quarter: Int16
    @NSManaged public var result: Int16
    @NSManaged public var timeRemaining: Int16
    @NSManaged public var playNumber: Int16
    @NSManaged public var game: Game?

}
