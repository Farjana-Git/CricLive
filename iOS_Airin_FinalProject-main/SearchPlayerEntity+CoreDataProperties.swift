//
//  SearchPlayerEntity+CoreDataProperties.swift
//  CricLive
//
//  Created by Bjit on 20/2/23.
//
//

import Foundation
import CoreData


extension SearchPlayerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SearchPlayerEntity> {
        return NSFetchRequest<SearchPlayerEntity>(entityName: "SearchPlayerEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var fullname: String?
    @NSManaged public var imagePath: String?

}

extension SearchPlayerEntity : Identifiable {

}
