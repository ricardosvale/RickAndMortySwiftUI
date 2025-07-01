//
//  Route.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 16/06/25.
//

import Foundation

enum Route: Hashable {
    case characters
    case universe
    case episodies
    case characterDetailView(character: Character)
    case episodeDetailView(episode: Episode, characters: [Character])
}
