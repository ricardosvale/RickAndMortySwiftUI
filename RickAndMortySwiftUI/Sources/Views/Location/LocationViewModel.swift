//
//  LocationViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 21/05/25.
//

import SwiftUI

@MainActor // Qualquer codigo dessa classe sera executado na Main Thread.

final class LocationViewModel: ObservableObject {
    @Published var location: [Location] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var currentPage = 1
    private var hasMorePages = true
    private var isFetchMore = false
    
    private let service: LocationServiceProtocol
    
    init(service: LocationServiceProtocol = LocationRequest()) {
        self.service = service
        
    }
    
    func fetchLocation() {
        location = []
        currentPage = 1
        hasMorePages = true
        loadMoreLocation()
    }
    
    func loadMoreLocation () {
        guard !isFetchMore && hasMorePages else { return }
        isFetchMore = true
        isLoading = (currentPage == 1)
        
        Task {
            defer {
                self.isFetchMore = false
                self.isLoading = false
            }
            
            do {
                let response = try await service.fetchLocationAwait(page: currentPage)
                location.append(contentsOf: response.results)
                hasMorePages = response.info.next != nil
                currentPage += 1
            } catch {
                if let apiError = error as? APIError {
                    errorMessage = apiError.localizedDescription
                } else {
                    errorMessage = "Ocorreu um erro inesperado: \(error.localizedDescription)"
                }
            }
        }
    }
    
}
