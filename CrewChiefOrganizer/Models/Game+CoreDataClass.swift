//
//  Game+CoreDataClass.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 8/7/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import Foundation
import CoreData
import UIKit


open class Game: NSManagedObject {
    class func createGameInMainContext() -> Game {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let moc = delegate.persistentContainer.viewContext
        let newGame = NSEntityDescription.insertNewObject(forEntityName: "Game", into: moc) as! Game
        return newGame
    }
    
    class func readAllGamesFromMainContext() -> [Game]? {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let moc = delegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest() as! NSFetchRequest<Game>
        do {
            let games = try moc.fetch(fetchRequest)
            return games
        } catch {
            // TODO: Handle failed fetch request
        }
        return nil
    }
}
