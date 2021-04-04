//
//  Stock+CoreDataProperties.swift
//  ArticleStocks
//
//  Created by 西山幹也 on 2021/04/05.
//
//

import Foundation
import CoreData


extension Stock {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stock> {
        return NSFetchRequest<Stock>(entityName: "Stock")
    }

    @NSManaged public var title: String
    @NSManaged public var url: URL
    @NSManaged public var id: Int64
    @NSManaged public var stockTagMaps: StockTagMap

}

extension Stock : Identifiable {

}
