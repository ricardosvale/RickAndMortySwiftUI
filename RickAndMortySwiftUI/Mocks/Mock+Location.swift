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
            name: "Earth",
            type: "Planet",
            dimension: "Dimension C-137",
            residents: [],
            url: "https://rickandmortyapi.com/api/location/1"
        )
    }
}
