//
//  RMService.swift
//  RickyAndMorty
//
//  Created by Zill-e-Abbas on 13.01.24.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared single instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty Api Call
    /// - parameters:
    ///      - request: Request instance
    ///      - type: The type of object we expect to get back
    ///      - completion: Callback with data or errors
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            /// Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: Pivate
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
