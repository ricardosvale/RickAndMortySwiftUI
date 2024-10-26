//
//  LocationResponse.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 26/10/24.
//

import Foundation

struct LocationResponse: Codable {
    let info: Info
    let results: [Location]
}
