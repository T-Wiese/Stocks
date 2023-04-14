//
//  StockFetcher.swift
//  Stocks
//
//  Created by Torin Wiese (Work) on 4/14/23.
//

import Foundation

struct StockFetcher {
    
    func fetchStocksFromURL(urlString: String) -> [Stock] {
        guard let url = URL(string: urlString) else {
            return []
        }
        guard let data = try? Data(contentsOf: url) else {
            return []
        }
        
        return parse(data)
    }
    
    func parse(_ data: Data) -> [Stock] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let portfolio = try decoder.decode(StockResult.self, from: data)
            return portfolio.stocks
        } catch {
            print(error)
            return []
        }
        
    }
}
