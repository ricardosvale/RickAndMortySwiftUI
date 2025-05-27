//
//  SessionEpisodeButton.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 25/05/25.
//

import SwiftUI

struct SessionEpisodeButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .font(.jost(.bold, size: 14))
                .foregroundStyle(.black)
                .background(isSelected ? .colorPrimary : .colorGray)
                .cornerRadius(10)
        }
    }
}

#Preview {
    SessionEpisodeButton(title: "Session 1", isSelected: true, action: {print("click") })
}
