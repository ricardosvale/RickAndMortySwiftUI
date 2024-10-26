//
//  CharactersResponse.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 26/10/24.
//

import Foundation

struct CharactersResponse: Codable {
    let info: String
    let results: [Character]
}
