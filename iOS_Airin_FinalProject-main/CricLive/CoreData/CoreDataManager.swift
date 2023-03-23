//
//  CoreDataManager.swift
//  CricLive
//
//  Created by Bjit on 20/2/23.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: For All
    
    func getAllRecords(search: String) -> [SearchPlayerEntity] {
        var playerArray = [SearchPlayerEntity]()
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<SearchPlayerEntity>(entityName: "SearchPlayerEntity")
            let predicate = NSPredicate(format: "fullname CONTAINS [c] %@", search)
            fetchRequest.predicate = predicate

            playerArray = try context.fetch(fetchRequest)
            print(playerArray)
        }
        catch {
            print(error.localizedDescription)
        }
        return playerArray
    }
    
    
    func addItems(data: PlayersData) {

            guard let entity = NSEntityDescription.entity(forEntityName: "SearchPlayerEntity", in: context) else {
                return
            }

            for item in data {
                let dataObject = NSManagedObject(entity: entity, insertInto: context)
                dataObject.setValue(item.id, forKey: "id")
                dataObject.setValue(item.fullname, forKey: "fullname")
                dataObject.setValue(item.image_path, forKey: "imagePath")
            }

            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
}
