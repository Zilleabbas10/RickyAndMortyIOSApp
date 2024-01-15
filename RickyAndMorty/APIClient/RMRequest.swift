//
//  RMRequest.swift
//  RickyAndMorty
//
//  Created by Zill-e-Abbas on 13.01.24.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    ///Desired Endpoint
    private let endpoint: RMEndpoint
    
    /// Path components, if any
    private let pathComponents: [String]
    
    /// Query arguments, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Constructing URL
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desiresd http method
    public let httpMethod = "Get"
    
    /// Mark Public
    ///
    /// Construct request
    /// - parameters:
    ///      - endpoint: Target endpoint
    ///      - pathComponents: Collection of Path Components
    ///      - queryParameters: Collection of Query Parameters
    public init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
