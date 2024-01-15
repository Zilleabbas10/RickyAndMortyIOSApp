//
//  RMGetCharactersResponse.swift
//  RickyAndMorty
//
//  Created by Zill-e-Abbas on 14.01.24.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}

