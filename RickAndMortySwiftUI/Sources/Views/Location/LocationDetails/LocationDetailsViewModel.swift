//
//  LocationDetailsViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 02/06/25.
//

import Foundation
import os

@MainActor
final class LocationDetailsViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var location: Location
    
    private let service: CharacterServiceProtocol
    private let logger = Logger(subsystem: "com.seuApp.RickAndMortySwiftUI", category: "LocationDetails")
    
    init(location: Location, service: CharacterServiceProtocol = CharacterRequest()) {
        self.location = location
        self.service = service
    }
    
    func fetchCharacters(url: [String]) async {
        var loadedCharacters: [Character] = []
        await withTaskGroup(of: Character?.self) { group in
            for characterUrl in url {
                group.addTask { [self] in
                    do {
                        return try await service.fetchCharacter(url: characterUrl)
                        
                    } catch {
                        print("Erro ao buscar personagem: \(error)")
                        return nil
                    }
                }
            }
            
            for await character in group {
                if let character = character {
                    loadedCharacters.append(character)
                }
            }
        }
        characters = loadedCharacters
        logger.info("Carregados \(self.characters.count) personagens.")
    }
}
