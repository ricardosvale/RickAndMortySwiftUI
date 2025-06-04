//
//  CharacterStatus.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 12/11/24.
//

import SwiftUI

enum CharacterStatus {
    case alive
    case dead
    case unknown
    
    var color: Color {
        switch self {
        case .alive:
            return .colorPrimary
        case .dead:
            return .colorDead
        case .unknown:
            return .colorUnknown
        }
    }
    
    var formatted: String {
        String(describing: self).capitalized
    }
    
    init(from string: String) {
        switch string.lowercased() {
        case "alive":
            self = .alive
        case "dead":
            self = .dead
        default:
            self = .unknown
        }
    }
}
