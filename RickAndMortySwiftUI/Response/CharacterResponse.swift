//
//  CharactersResponse.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 26/10/24.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}
