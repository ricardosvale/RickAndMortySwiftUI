//
//  EpisodeViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 27/05/25.
//

import Foundation

@MainActor
final class EpisodeViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var filteredEpisodes: [Episode] = []
    @Published var sessions: [EpisodeSession] = []
    @Published var selectedSession: EpisodeSession?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var character: [Character] = []
    
    private let service: EpisodeServiceProtocol
    private let characterService: CharacterServiceProtocol
    
    init(service: EpisodeServiceProtocol = EpisodesRequest(), characterService: CharacterServiceProtocol = CharacterRequest()) {
        self.service = service
        self.characterService = characterService
    }
    
    func loadEpisodes() {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let response = try await service.fetchEpisodes()
                
                self.episodes = response.results
                self.sessions = self.extractSessions(from: response.results)
                
                if let firstSession = self.sessions.first {
                    self.selectedSession = firstSession
                    self.filterEpisodes(season: firstSession)
                } else {
                    self.selectedSession = nil
                    self.filteredEpisodes = []
                }
                self.isLoading = false
                
            } catch {
                
                if let apiError = error as? APIError {
                    self.errorMessage = apiError.localizedDescription
                } else {
                    self.errorMessage = "Ocorreu um erro inesperado: \(error.localizedDescription)"
                }
                self.isLoading = false
                self.filteredEpisodes = []
                self.sessions = []
            }
        }
    }
    
    func extractSessions(from episodes: [Episode]) -> [EpisodeSession] {
        let seasonsStrings = episodes.compactMap { episode in
            episode.episode.components(separatedBy: "E").first
        }
        let uniqueSeasons = Set(seasonsStrings)
        let sessions = uniqueSeasons.map { EpisodeSession(rawValue: $0)}
        return sessions.sorted { $0.rawValue < $1.rawValue }
    }
    
    func filterEpisodes(season: EpisodeSession) {
        selectedSession = season
        filteredEpisodes = episodes.filter { $0.episode.hasPrefix(season.rawValue)}
    }
    
    func loadCharactersForEpisode(episode: Episode) async {
        var characterList: [Character] = []
        for characterUrl in episode.characters {
            do {
                let character = try await characterService.fetchCharacter(url: characterUrl)
                characterList.append(character)
            } catch {
                self.errorMessage = "Error loading characters"
            }
        }
        self.character = characterList
    }
}
