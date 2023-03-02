//
//  StocksAPIExec.swift
//  
//
//  Created by Le Bon B' Bauma on 28/02/2023.
//

import Foundation
import StocksAPI

@main
struct StocksAPIExec {
    
    static let stocksAPI = StocksAPI()
    
    static func main() async {
        do {
            let quotes = try await stocksAPI.fetchQuotes(symbols: "AAPL,MSFT,GOOG,TSLA")
            print(quotes)
            
            let tickers = try await stocksAPI.searchTickers(query: "tesla")
            print(tickers)
        } catch {
            print(error.localizedDescription)
        }
     
    }
}
