//
//  CharacterRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 17/04/25.
//

import Foundation

final class CharacterRequest: CharacterServiceProtocol {

    func fetchCharactesAwait() async throws -> [Character] {

        guard let url = URL(string: Endpoint.characters) else {
            throw APIError.invalidURL
        }

        do {

            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                throw APIError.invalidStatusCode(statusCode)
            }

            let decoder = JSONDecoder()
            let characterData = try decoder.decode(CharacterResponse.self, from: data)
            return characterData.results
        } catch is DecodingError {
            throw APIError.decodingFailed
         } catch {
            throw APIError.networkError(error)
        }
    }
}
