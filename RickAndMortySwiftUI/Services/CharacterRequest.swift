//
//  CharacterRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 17/04/25.
//

import Foundation

final class CharacterRequest: CharacterServiceProtocol {
    
    func fetchCharactesAwait(page: Int) async throws -> CharacterResponse {
        
        guard let url = URL(string: Endpoint.characters + "\(page)") else {
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
            let characterData = try decoder.decode(CharacterResponse.self, from: data)
            return characterData
        } catch is DecodingError {
            throw APIError.decodingFailed
        } catch {
            throw APIError.networkError(error)
        }
    }
    
    func fetchCharacter(url: String) async throws ->  Character {
        guard let url = URL(string: url) else {
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
            
            do {
                let decoder = JSONDecoder()
                let character = try decoder.decode(Character.self, from: data)
                return character
            } catch is DecodingError {
                throw APIError.decodingFailed
            }
        } catch {
            throw APIError.networkError(error)
        }
    }
    
    func fetchGeneric<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw APIError.invalidStatusCode(statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            throw APIError.decodingFailed
        }
    }
}
