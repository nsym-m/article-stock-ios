//
//  SplashView.swift
//  ArticleStocks
//
//  Created by 西山幹也 on 2021/04/02.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    
    var body: some View {
        VStack {
            if self.isActive {
                MainView()
            } else {
                Text("Splash Screen")
            }
        }
        .onAppear {
            DispatchQueue.main  .asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
