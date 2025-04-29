//
//  CharactersViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 11/11/24.
//
import SwiftUI
import Combine

final class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func fetchCharacters() {
        isLoading = true
        errorMessage = nil
        
        ServiceTeste.loadCharacter { [weak self] response in
            self?.isLoading = false
            self?.characters = response.results
        } onError: { [weak self] error in
            self?.isLoading = false
            switch error {
            case .url:
                self?.errorMessage = "URL inválida."
            case .noResponse:
                self?.errorMessage = "Sem resposta do servidor."
            case .noData:
                self?.errorMessage = "Nenhum dado foi retornado."
            case .taskError(let error):
                self?.errorMessage = "Erro de conexão: \(error.localizedDescription)"
            case .responseStatusCode(let code):
                self?.errorMessage = "Erro HTTP: \(code)"
            case .invalidJSON:
                self?.errorMessage = "Erro ao decodificar JSON."
            }
        }
    }
    
    func fetchCharactersData() {
        Task {
            do {
                let characters = try await fetchCharactersAwait
            } catch {
                
            }
            
        }
    }
}
