//
//  Tag+CoreDataProperties.swift
//  ArticleStocks
//
//  Created by 西山幹也 on 2021/04/05.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var name: String
    @NSManaged public var id: Int64
    @NSManaged public var stockTagMaps: StockTagMap

}

extension Tag : Identifiable {

}
