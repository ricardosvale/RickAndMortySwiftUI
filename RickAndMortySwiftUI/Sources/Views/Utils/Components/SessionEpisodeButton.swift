//
//  SessionEpisodeButton.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 25/05/25.
//

import SwiftUI

struct SessionEpisodeButton: View {
    let session: EpisodeSession
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(session.displayName)
                .padding(.horizontal, 10)
                .padding(.vertical, 2)
                .font(.jost(.bold, size: 14))
                .foregroundStyle(.black)
                .background(.colorPrimary)
                .cornerRadius(10)
        }
    }
}

#Preview {
    SessionEpisodeButton(session: EpisodeSession.session1, action: {print("click") })
}
