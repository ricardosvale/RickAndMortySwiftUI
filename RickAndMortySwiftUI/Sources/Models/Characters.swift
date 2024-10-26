//
//  Characters.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 26/10/24.
//
import Foundation

struct Characters: Codable, Identifiable {

    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Locations
    let image: String
    let episode: [String]
    
}

