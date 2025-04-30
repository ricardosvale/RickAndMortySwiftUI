//
//  ApiService.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 26/10/24.
//
import Foundation

final class ApiServiceCharacter: ObservableObject {

    static var singleton = ApiServiceCharacter()
    private let baseUrl: String = "https://rickandmortyapi.com/api/character"

    @Published var characters: [Character] = []

    func getCharacters() {
       // transformando a string em uma URL
        guard let url = URL(string: baseUrl) else { return }

        // Criando a tarefa para a solicitação dos dados

        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {return}
               do {
                   let decodedResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                   DispatchQueue.main.async {
                       self.characters = decodedResponse.results
                       print("Resultado:\(decodedResponse.results[0])")
                   }
               } catch {
                   print("Falha ao decodificar o JSON\(error)")

               }
         }
        task.resume()
    }

}
