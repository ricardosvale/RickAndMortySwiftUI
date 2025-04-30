//
//  LocationRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 30/04/25.
//

import Foundation

final class LocationRequest: LocationServiceProtocol {
    
    func fetchLocationAwait() async throws -> [Location] {
        guard let url = URL(string: Endpoint.locations) else {
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
            let locations = try decoder.decode(LocationResponse.self, from: data)
            return locations.results
            
        } catch is DecodingError {
            throw APIError.decodingFailed
        } catch {
            throw APIError.networkError(error)
        }
    }
}
