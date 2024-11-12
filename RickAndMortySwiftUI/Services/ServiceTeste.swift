//
//  ServiceTeste.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 29/10/24.
//

import Foundation

enum CharacterError: Error {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

final class ServiceTeste {
    private static let basePath = "http://localhost:3000/https:/rickandmortyapi.com/api/character"
    
    class func loadCharacter(onComplete: @escaping (CharacterResponse) -> Void, onError: @escaping (CharacterError) -> Void) {
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
        }
         
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Connection error: \(error.localizedDescription)")
                onError(.taskError(error: error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                onError(.noResponse)
                return
            }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    onError(.noData)
                    return
                }
                
                do {
                    let characters = try JSONDecoder().decode(CharacterResponse.self, from: data)
                    
                    // Exibir no console a resposta decodificada
                    print("Decoded API Response: \(characters)")
                    
                    DispatchQueue.main.async {
                        onComplete(characters)
                    }
                    
                } catch {
                    print("JSON decoding error: \(error.localizedDescription)")
                    onError(.invalidJSON)
                }
            } else {
                print("HTTP Error: \(response.statusCode)")
                onError(.responseStatusCode(code: response.statusCode))
            }
        }
        task.resume()
    }
}
