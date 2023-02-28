//
//  Ticker.swift
//  
//
//  Created by Le Bon B' Bauma on 28/02/2023.
//

import Foundation


public struct SearchTickerResponse: Decodable {
    public let data: [Ticker]?
    public let error: ErrorResponse?
    
    
    enum CodingKeys: CodingKey {
        case quotes
        case finance
    }
    
    enum FinanceKeys : CodingKey {
        case error
    }
    
    public init(from decoder: Decoder) throws {
        let conatiner = try decoder.container(keyedBy: CodingKeys.self)
        data = try? conatiner.decodeIfPresent([Ticker].self, forKey: .quotes)
        error = try? conatiner.nestedContainer(keyedBy: FinanceKeys.self , forKey: .finance)
            .decodeIfPresent(ErrorResponse.self, forKey: .error)
    }
}

public struct Ticker: Codable, Identifiable, Equatable {
    
    public let id = UUID()
    
    public let symbol: String
    public let quoteType: String?
    public let shortname: String?
    public let longname: String?
    public let sector: String?
    public let industry: String?
    public let exchDisp: String?
    
    public init(symbol: String, quoteType: String?, shortname: String?, longname: String?, sector: String?, industry: String?, exchDisp: String?) {
        self.symbol = symbol
        self.quoteType = quoteType
        self.shortname = shortname
        self.longname = longname
        self.sector = sector
        self.industry = industry
        self.exchDisp = exchDisp
    }
}
