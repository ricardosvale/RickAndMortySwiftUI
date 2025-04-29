//
//  CharacterServiceProtocol.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 29/04/25.
//

import Foundation

protocol CharacterServiceProtocol {
    func fetchCharactesAwait() async throws -> [Character]
}
