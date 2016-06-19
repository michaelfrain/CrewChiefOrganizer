//
//  Game+CoreDataClass.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 6/18/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Game: NSManagedObject {
    class func createGameInMainContext() -> Game {
        let delegate = UIApplication.shared().delegate as! AppDelegate
        let moc = delegate.persistentContainer.viewContext
        let newGame = NSEntityDescription.insertNewObject(forEntityName: "Game", into: moc) as! Game
        return newGame
    }
}
