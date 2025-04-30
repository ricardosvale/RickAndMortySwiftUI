//
//  ApiServiceLocation.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 29/10/24.
//

import Foundation
import Combine

class ApiServiceLocation: ObservableObject {
    private let baseUrl: String = "https://rickandmortyapi.com/api/location"
    
    @Published var locations: [Location] = []
    
    func getCharacters() {
       // transformando a string em uma URL
        guard let url = URL(string: baseUrl) else { return }
         
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
           if let data = data {
               do {
                   let decodedResponse = try JSONDecoder().decode(LocationResponse.self, from: data)
                   DispatchQueue.main.async {
                       self.locations = decodedResponse.results
                       print("Resultado:\(decodedResponse.results[0])")
                   }
               } catch {
                   print("Falha ao decodificar o JSON\(error)")
               
               }
            }
        }
        task.resume()
    }
    
}
