//
//  CharactersViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 11/11/24.
//

import Foundation

@MainActor
final class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var currentPage = 1
    private var hasMorePages = true
    private var isFetchMore = false
    
    private let service: CharacterServiceProtocol
    
    init(service: CharacterServiceProtocol = CharacterRequest()) {
        self.service = service
        fetchCharactersData()
    }
    
    func fetchCharactersData() {
        characters = []
        currentPage = 1
        hasMorePages = true
        loadMoreCharacters()
    }
    
    func loadMoreCharacters () {
        guard !isFetchMore && hasMorePages else { return }
        isFetchMore = true
        isLoading = (currentPage == 1)
        Task {
            defer {
                self.isFetchMore = false
                self.isLoading = false
            }
            
            do {
                let response = try await service.fetchCharactesAwait(page: currentPage)
                characters += response.results
                hasMorePages = response.info.next != nil
                currentPage += 1
            } catch {
                if let apiError = error as? APIError {
                    errorMessage = apiError.localizedDescription
                } else {
                    errorMessage = "Ocorreu um erro inesperado: \(error.localizedDescription)."
                }
            }
        }
    }
}
