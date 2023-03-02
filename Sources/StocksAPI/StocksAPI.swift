

import Foundation

public struct StocksAPI {
    private let session = URLSession.shared
     private let jsonDecoder = {
         let decoder = JSONDecoder()
         decoder.dateDecodingStrategy = .secondsSince1970
         return decoder
    }()
    
    private let baseURL = "https://query1.finance.yahoo.com"
    public init() {}
    
    public func searchTickers(query: String, isEquityTypeOnly: Bool = true) async throws -> [Ticker] {
        guard var urlComponents = URLComponents(string:  "\(baseURL)/v1/finance/search") else {
            throw APIError.invalidURL
        }
        urlComponents.queryItems = [
            .init(name: "q", value: query),
            .init(name: "quotesCount", value: "20"),
            .init(name: "lang", value: "en-US")
        ]
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        
        let (response, statusCode): (SearchTickerResponse, Int) = try await fetch(url: url)
        if let error = response.error {
            throw APIError.httpStatusCodeFailed(statusCode: statusCode, error: error)
        }
        
        if isEquityTypeOnly {
            return (response.data ?? [])
                .filter{ ($0.quoteType ?? "").localizedCaseInsensitiveCompare("equity") == .orderedSame }
        } else {
            return response.data ?? []
        }
    }
    
    public func fetchQuotes(symbols: String) async throws -> [Quote] {
        guard var urlComponents = URLComponents(string:  "\(baseURL)/v7/finance/quote") else {
            throw APIError.invalidURL
        }
        urlComponents.queryItems = [.init(name: "symbols", value: symbols)]
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        
        let (response, statusCode): (QuoteResponse, Int) = try await fetch(url: url)
        if let error = response.error {
            throw APIError.httpStatusCodeFailed(statusCode: statusCode, error: error)
        }
        return response.data ?? []
    }
    
    
    
    private func fetch<D: Decodable>(url: URL) async throws -> (D, Int) {
        let (data, response) = try await session.data(from: url)
        let statusCode = try validateHTTPResponse(response)
        return(try jsonDecoder.decode(D.self, from: data), statusCode)
    }
    
    private func validateHTTPResponse(_ response: URLResponse) throws -> Int {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponseType
        }
        
        guard 200...299 ~= httpResponse.statusCode ||
                400...499 ~= httpResponse.statusCode
        else {
            throw APIError.httpStatusCodeFailed(statusCode: httpResponse.statusCode, error: nil)
        }
        
        return httpResponse.statusCode
    }
    
}

