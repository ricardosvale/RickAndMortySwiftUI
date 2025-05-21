//
//  Endpoint.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 29/04/25.
//

import Foundation

enum Endpoint {
    static let base = "https://rickandmortyapi.com/api/"
    static let characters = base + "character?page="
    static let locations = base + "location?page="
    static let episodes = base + "episode"
}
