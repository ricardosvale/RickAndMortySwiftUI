//
//  ServiceTeste.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 29/10/24.
//

import Foundation

final class ServiceTeste {
    private static let basePath = "https://rickandmortyapi.com/api/character"
    
    class func loadCharacter() {
        // Transformando minha string em uma URL
        guard let url = URL(string: basePath) else { return }
        
        // Criando a Tarefa de Sessão usando completion
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                // Verificando se o response e tratando ele como HTTURLResponse
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    
                    do {
                        // Decodificando o JSON e atribuido o data no CharacterResponse
                        let characters = try JSONDecoder().decode(CharacterResponse.self, from: data)
                        for character in characters.results {
                            print(character.name)
                        }
                    } catch{
                        print(error.localizedDescription)
                    }
                }else {
                    print("Erro no servidor!")
                }
                
                
            } else{
                print(error!)
            }
            
        }
        task.resume()
    }
}

