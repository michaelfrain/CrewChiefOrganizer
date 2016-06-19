//
//  Penalty+CoreDataProperties.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 6/18/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData

extension Penalty {

    @nonobjc class func fetchRequest() -> NSFetchRequest<Penalty> {
        return NSFetchRequest<Penalty>(entityName: "Penalty");
    }

    @NSManaged var quarter: Int16
    @NSManaged var timeRemaining: Int16
    @NSManaged var isHomeTeam: Bool
    @NSManaged var foul: String?
    @NSManaged var foulingSide: Int16
    @NSManaged var playerNumber: Int16
    @NSManaged var result: Int16
    @NSManaged var officials: NSObject?

}
