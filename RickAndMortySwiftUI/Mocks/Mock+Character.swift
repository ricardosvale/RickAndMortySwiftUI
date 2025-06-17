//
//  Mock+Character.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 18/12/24.
//

import Foundation

extension Character {
    static func characterMock() -> Character {
        Character(id: 1,
                  name: "Rick Sanchez",
                  status: "Alive",
                  species: "Human",
                  gender: "Male",
                  origin: Origin(name: "Earth", url: ""),
                  location: LocationCharacter(name: "Citadel of Ricks", url: ""),
                  image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                  episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"])
    }
    
    static func characterMock1() -> [Character] {
        [Character(id: 1,
                   name: "Rick Sanchez",
                   status: "Alive",
                   species: "Human",
                   gender: "Male",
                   origin: Origin(name: "Earth", url: ""),
                   location: LocationCharacter(name: "Citadel of Ricks", url: ""),
                   image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                   episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"]),
         Character(id: 2,
                     name: "Morty Smith",
                     status: "Alive",
                     species: "Human",
                     gender: "Male",
                     origin: Origin(
                         name: "unknown",
                         url: ""),
                     location: LocationCharacter(
                         name: "Citadel of Ricks",
                         url: "https://rickandmortyapi.com/api/location/3"
                     ),
                     image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                     episode: [
                         "https://rickandmortyapi.com/api/episode/1",
                         "https://rickandmortyapi.com/api/episode/2"])
                 ]
    }
}
