//
//  EpisodesRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 24/05/25.
//

import Foundation

final class EpisodesRequest: EpisodeServiceProtocol {
    
    func fetchEpisodes() async throws -> EpisodeResponse {
        
        var allEpisode: [Episode] = []
        var nextURL: String? = Endpoint.episodes
        
        repeat {
            guard let urlString = nextURL, let url = URL(string: urlString) else {
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
                let pageResponse = try decoder.decode(EpisodeResponse.self, from: data)
                
                allEpisode.append(contentsOf: pageResponse.results)
                nextURL = pageResponse.info.next
                
            } catch is DecodingError {
                throw APIError.decodingFailed
            } catch {
                throw APIError.networkError(error)
            }
        }
            while nextURL != nil
                return EpisodeResponse(info: Info(count: allEpisode.count, pages: 1, next: nil, prev: nil), results: allEpisode)
    }
}
