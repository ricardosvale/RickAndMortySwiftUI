//
//  SessionEpisodeButton.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 25/05/25.
//

import SwiftUI

enum EpisodeSession: String, CaseIterable, Identifiable {
    
    case session1 = "S01"
    case session2 = "S02"
    case session3 = "S03"
    case session4 = "S04"
    case session5 = "S05"
    case session6 = "S06"
    case session7 = "S07"
    
    var id: String {self.rawValue}
    
    var displayName: String {
        switch self {
        case .session1: return "Session 1"
        case .session2: return "Session 2"
        case .session3: return "Session 3"
        case .session4: return "Session 4"
        case .session5: return "Session 5"
        case .session6: return "Session 6"
        case .session7: return "Session 7"
        }
    }
}
