//
//  File.swift
//  
//
//  Created by Le Bon B' Bauma on 28/02/2023.
//

import Foundation
import StocksAPI

@main
struct StocksAPIExec {
    
    static func main() async {
        let (data, _) = try! await URLSession.shared.data(from: URL(string: "https://query1.finance.yahoo.com/v7/finance/quote?")!)
        
        let quoteResponse = try! JSONDecoder().decode(QuoteResponse.self, from: data)
        print(quoteResponse)
        
    }
}
