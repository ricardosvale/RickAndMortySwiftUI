//
//  Mock+Location.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 22/05/25.
//

import Foundation

extension Location {
    static func locationMock() -> Location {
        Location(
            id: 1,
            name: "Earth (New York City)",
            type: "Planet",
            dimension: "Unknown",
            residents: [],
            url: "https://rickandmortyapi.com/api/location/1"
        )
    }
}
