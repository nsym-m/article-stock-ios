//
//  StockTagMap+CoreDataProperties.swift
//  ArticleStocks
//
//  Created by 西山幹也 on 2021/04/05.
//
//

import Foundation
import CoreData


extension StockTagMap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StockTagMap> {
        return NSFetchRequest<StockTagMap>(entityName: "StockTagMap")
    }

    @NSManaged public var id: Int64
    @NSManaged public var stockId: Int64
    @NSManaged public var tagId: Int64
    @NSManaged public var stocks: Stock
    @NSManaged public var tags: Tag

}

extension StockTagMap : Identifiable {

}
