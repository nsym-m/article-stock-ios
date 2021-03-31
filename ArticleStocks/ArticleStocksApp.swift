//
//  ArticleStocksApp.swift
//  ArticleStocks
//
//  Created by 西山幹也 on 2021/04/01.
//

import SwiftUI

@main
struct ArticleStocksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
