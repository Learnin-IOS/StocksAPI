

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

