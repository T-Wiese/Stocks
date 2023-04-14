//
//  PortfolioView.swift
//  Stocks
//
//  Created by Torin Wiese (Work) on 4/13/23.
//

import SwiftUI

struct PortfolioView: View {
    @StateObject var manager: StockManager
    var body: some View {
        /*Table(manager.stocks){
            TableColumn("Stock Symbol", value: \.ticker)
            TableColumn("Price", value: \.currentPriceDollars)
            TableColumn("Quantity", value: \.quantityString)
         */
        VStack {
            if(!manager.stocks.isEmpty) {
                
                HStack {
                    Cell(value: "Stock", header: true)
                    Cell(value: "$ / Share", header: true)
                    Cell(value: "Shares Owned", header: true)
                }
                List{
                    ForEach(manager.stocks) { stock in
                        StockView(stock: stock)
                    }
                }.refreshable {
                    manager.fetchStocks()
                }
            } else if(manager.error != nil) {
                Text(manager.error!)
                Button("Tap To Retry", action: {
                    manager.fetchStocks()
                })
            } else if (manager.loading) {
                ProgressView()
            }
        }.task {
            manager.fetchStocks()
        }
    }

}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView(manager: StockManager())
    }
}
