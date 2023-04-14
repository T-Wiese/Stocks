//
//  ContentView.swift
//  Stocks
//
//  Created by Torin Wiese (Work) on 4/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var manager = StockManager()
    var body: some View {
        VStack {
            PortfolioView(manager: manager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
