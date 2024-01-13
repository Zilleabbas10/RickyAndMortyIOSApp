//
//  RMEndpoint.swift
//  RickyAndMorty
//
//  Created by Zill-e-Abbas on 13.01.24.
//

import Foundation

/// Represents unique API endpoints
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character // "character"
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
