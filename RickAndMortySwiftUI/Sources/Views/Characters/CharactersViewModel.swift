//
//  CharactersViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 11/11/24.
//
import SwiftUI
import Combine

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
    }
  func fetchCharactersData() {
        currentPage = 1
      hasMorePages = true
      characters = []
      loadMoreCharacters()
    }
    
    func loadMoreCharacters () {
        guard !isLoading && !isFetchMore && hasMorePages else { return }
        isFetchMore = true
        Task {
            isLoading = true

            do {
               let response = try await service.fetchCharactesAwait(page: currentPage)
                characters += response.results
                currentPage += 1
                hasMorePages = response.info.next != nil
            } catch {
                if let apiError = error as? APIError {
                    errorMessage = apiError.localizedDescription
                } else {
                    errorMessage = "Ocorreu um erro inesperado: \(error.localizedDescription)."
                }
            }
            isFetchMore = false
            isLoading = false
        }
    }
}
