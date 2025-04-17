//
//  BaseURL.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 17/04/25.
//

import Foundation

struct BaseURL {
    static let components: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api"
        return components
    }()
}
