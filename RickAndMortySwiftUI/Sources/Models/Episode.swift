//
//  Episode.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 26/10/24.
//

import Foundation

struct Episode: Codable, Identifiable {
    let id: Int?
    let name: String
    let airDate: String
    let episode: String
    let characters: [Character]

    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters
        case airDate = "air_date"

    }
}
