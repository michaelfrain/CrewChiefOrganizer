//
//  Penalty+CoreDataClass.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 8/7/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class Penalty: NSManagedObject {
    class func createPenaltyInMainContext() -> Penalty {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let moc = delegate.persistentContainer.viewContext
        let newPenalty = NSEntityDescription.insertNewObject(forEntityName: "Penalty", into: moc) as! Penalty
        return newPenalty
    }
}
