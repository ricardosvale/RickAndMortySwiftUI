//
//  Mock+Episode.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 23/05/25.
//

import Foundation

extension Episode {
    static func episodemock() -> Episode {
        return Episode(
            id: 1,
            name: "Pilot",
            airDate: "December 2, 2013",
            episode: "S01E02",
            characters: ["https://rickandmortyapi.com/api/character/1",
                         "https://rickandmortyapi.com/api/character/2"],
            url: "https://rickandmortyapi.com/api/episode/1",
            created: "2017-11-10T12:56:33.798Z"
        )
    }
}
