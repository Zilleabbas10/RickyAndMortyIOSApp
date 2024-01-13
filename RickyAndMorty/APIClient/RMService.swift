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
    
    /// Send Rick and Morty Api Call
    /// - parameters:
    ///      - request: Request instance
    ///      - completion: Callback with data or errors
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}