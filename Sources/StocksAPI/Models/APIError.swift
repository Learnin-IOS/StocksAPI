//
//  APIError.swift
//  
//
//  Created by Le Bon B' Bauma on 01/03/2023.
//

import Foundation

public enum APIError: CustomNSError {
    
    case invalidURL
    case invalidResponseType
    case httpStatusCodeFailed(statusCode: Int, error: ErrorResponse?)
    
    
    public static var errorDomain: String {
        "StocksAPI"
    }
    
    public var errorCode: Int{
        switch self {
        case .invalidURL: return 0
        case .invalidResponseType: return 1
        case .httpStatusCodeFailed: return 2
            
        }
    }
    
    public var errorUserInfo: [String : Any] {
        
        let text: String
        switch self {
        case .invalidURL:
            text = "Invalid URL"
        case .invalidResponseType:
            text = "Invalid Response Type"
        case let .httpStatusCodeFailed(statusCode, error):
            if let error = error {
                text = "Error: Status Code: \(statusCode), message \(error.description)"
            } else {
                text = "Error: Status Code: \(statusCode)"
            }
        }
        return [NSLocalizedDescriptionKey: text]
    }
    
}
