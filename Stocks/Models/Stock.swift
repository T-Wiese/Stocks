//
//  Stock.swift
//  Stocks
//
//  Created by Torin Wiese (Work) on 4/13/23.
//

import Foundation

struct Stock: Decodable, Identifiable {
    let ticker: String
    let name: String
    let currency: String
    let currentPriceCents: Int
    let quantity: Int?
    let currentPriceTimestamp: Int
    
    var id: String { ticker }
    var quantityString: String {
        if(quantity ?? 0 > 0) {
            return String(quantity!)
        } else {
            return String(0)
        }
    }
    var currentPriceDollars: String {
        let cpd: Double = Double(currentPriceCents) / 100
        return "$" + String(cpd)
    }
}

struct StockResult: Decodable {
    let stocks: [Stock]
}
