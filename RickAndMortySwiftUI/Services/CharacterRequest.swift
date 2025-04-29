//
//  CharacterRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 17/04/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case decodingFailed
    case networkError(Error)
}

enum BaseURL {
    static let api = "https://rickandmortyapi.com/api/"
}
final class CharacterRequest {
    
    func fetchCharactersAwait() async throws -> [Character] {
        let endpoint = "\(BaseURL.api)character"
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        do {
            
            let (data, response) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let characterData = try decoder.decode(CharacterResponse.self, from: data)
            return characterData.results
            
        } catch  {
            throw APIError.networkError(error)
        }
    }
}

