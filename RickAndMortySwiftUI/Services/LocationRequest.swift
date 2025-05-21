//
//  LocationRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 30/04/25.
//

import Foundation

final class LocationRequest: LocationServiceProtocol {
    
    func fetchLocationAwait(page: Int) async throws -> LocationResponse {
        
        guard let url = URL(string: Endpoint.locations + "\(page)") else {
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
            
            let decoder = JSONDecoder()
            let locations = try decoder.decode(LocationResponse.self, from: data)
            return locations
            
        } catch is DecodingError {
            throw APIError.decodingFailed
        } catch {
            throw APIError.networkError(error)
        }
    }
}
