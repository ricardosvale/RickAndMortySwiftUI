//
//  EpisodeServiceProtocol.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 24/05/25.
//

import Foundation

protocol EpisodeServiceProtocol {
   static func fetchEpisodes() async throws -> EpisodeResponse
}
