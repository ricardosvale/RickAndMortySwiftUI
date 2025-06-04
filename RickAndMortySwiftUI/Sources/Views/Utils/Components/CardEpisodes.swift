//
//  Episodes.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 07/04/25.
//

import SwiftUI

struct CardEpisodes: View {
    var episode: Episode
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(episode.name)
                    .font(.jockeyOne(size: 24))
                Text(episode.airDate)
                    .font(.kodeMono(.regular, size: 14))

            }
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            Spacer()
            Text(episode.episode)
                .font(.kodeMono(.regular, size: 14))
                .padding(.vertical, -15)
                .padding(.horizontal, 15)
        }
        .foregroundStyle(.white)
        .background(.episodes)
        .cornerRadius(5)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 23)     
    }

}

#Preview {
    CardEpisodes(episode: Episode.episodemock())
}
