//
//  ChartRange.swift
//  
//
//  Created by Le Bon B' Bauma on 02/03/2023.
//

import Foundation


public enum ChartRange: String, CaseIterable {
    case oneDay = "1d"
    case oneWeek = "5d"
    case oneMonth = "1mo"
    case threeMonth = "3mo"
    case sixMonth = "6mo"
    case ytd
    case oneYear = "1y"
    case twoYear = "2y"
    case fiveYear = "5y"
    case tenYear = "10y"
    case max
    
    public var interval: String {
        switch self {
        case .oneDay: return "1m"
        case .oneWeek: return "5m"
        case .oneMonth: return "90m"
        case .threeMonth, .sixMonth,.ytd, .oneYear, .twoYear: return "1d"
        case .fiveYear, .tenYear: return "1wk"
        case .max: return "3mo"
        }
    }
}
