//
//  Penalty+CoreDataProperties.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 7/16/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData

extension Penalty {

    @nonobjc class func fetchRequest() -> NSFetchRequest<Penalty> {
        return NSFetchRequest<Penalty>(entityName: "Penalty");
    }

    @NSManaged var foul: String?
    @NSManaged var foulingSide: Int16
    @NSManaged var isHomeTeam: Bool
    @NSManaged var officials: NSObject?
    @NSManaged var playerNumber: Int16
    @NSManaged var quarter: Int16
    @NSManaged var result: Int16
    @NSManaged var timeRemaining: Int16

}
