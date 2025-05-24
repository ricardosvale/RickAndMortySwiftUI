//
//  EpisodesRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 24/05/25.
//

import Foundation

final class EpisodesRequest: EpisodeServiceProtocol {
   static func fetchEpisodes() async throws -> EpisodeResponse {
        guard let url = URL(string: Endpoint.episodes) else {
            throw APIError.invalidURL
        }
        print(url)
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                throw APIError.invalidStatusCode(statusCode)
            }
            let decoder  = JSONDecoder()
            let episodes = try decoder.decode(EpisodeResponse.self, from: data)
            return episodes
        }
        catch is DecodingError {
            throw APIError.decodingFailed
        } catch {
            throw APIError.networkError(error)
        }
        
    }
}
