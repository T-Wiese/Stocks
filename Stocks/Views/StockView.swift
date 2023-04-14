//
//  StockView.swift
//  Stocks
//
//  Created by Torin Wiese (Work) on 4/13/23.
//

import SwiftUI

struct StockView: View {
    let stock: Stock

    var body: some View {
        HStack() {
            Cell(value: stock.ticker, header: false)
            Cell(value: stock.currentPriceDollars, header: false)
            Cell(value: String(stock.quantity ?? 0), header: false)
        }
        
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stock: Stock(ticker: "TZF", name: "TZFWiese", currency: "USD", currentPriceCents: 314, quantity: 2, currentPriceTimestamp: 1681413886))
    }
}


