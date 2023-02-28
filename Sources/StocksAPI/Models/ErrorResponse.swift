//
//  ErrorResponse.swift
//  
//
//  Created by Le Bon B' Bauma on 28/02/2023.
//

import Foundation

public struct ErrorResponse: Codable {
    
    public let code: String
    public let description: String
    
    public init(code: String, description: String) {
        self.code = code
        self.description = description
    }
}
