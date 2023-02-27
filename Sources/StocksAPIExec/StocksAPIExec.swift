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
        print(StocksAPI().text)
    }
}
