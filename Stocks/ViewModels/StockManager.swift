//
//  StockManager.swift
//  Stocks
//
//  Created by Torin Wiese (Work) on 4/13/23.
//

import Foundation

class StockManager: ObservableObject {
    
    @Published var stocks: [Stock] = []
    @Published var loading: Bool = false
    @Published var error: String? = nil
    private var fetcher = StockFetcher()
    
    func fetchStocks() {
        error = nil
        loading = true

        DispatchQueue.global().asyncAfter(deadline: .now() + 4) {
            self.updateStocks(stockList: self.fetcher.fetchStocksFromURL(urlString: Endpoints.prod))
        }
    }
    
    private func updateStocks(stockList: [Stock]) {
        DispatchQueue.main.async {
            if(stockList.isEmpty) {
                self.error = "Error Loading Portfolio"
            }
            self.stocks = stockList
            self.loading = false
        }
    }
    

}
