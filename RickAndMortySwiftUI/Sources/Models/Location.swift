//
//  Location.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 26/10/24.
//

import Foundation

struct Location: Codable, Identifiable {

    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String

}
