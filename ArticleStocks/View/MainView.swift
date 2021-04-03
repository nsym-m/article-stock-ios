//
//  MainView.swift
//  ArticleStocks
//
//  Created by 西山幹也 on 2021/04/02.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            StockListView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .frame(width: 40, height: 40)
                    Text("StockList")
                }
            OtherView()
                .tabItem {
                    Image(systemName: "circle.grid.hex.fill")
                    Text("Other")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.locale, .init(identifier: "ja"))
    }
}
