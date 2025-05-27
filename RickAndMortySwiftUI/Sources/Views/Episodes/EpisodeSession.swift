//
//  SessionEpisodeButton.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 25/05/25.
//

import Foundation

struct EpisodeSession: Identifiable, Hashable {
    
    let rawValue: String // Ex: "S01"
    
    var id: String { rawValue }
    
    var displayName: String {
        if rawValue.starts(with: "S") {
            let seasonNumberSubstring = rawValue.dropFirst()
            
            if let seasonNumber = Int(String(seasonNumberSubstring)) {
                return "Season \(seasonNumber)"
            }
        }
        return rawValue
    }
}
