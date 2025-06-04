//
//  EpisodeView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 27/05/25.
//

import SwiftUI

struct EpisodeView: View {
    
    @StateObject private var viewModel = EpisodeViewModel()
    let rows = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ZStack {
            Background(color: .back)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("EPISÓDIOS")
                    .font(.jockeyOne(size: 32))
                    .padding(.top, 40)
                    .padding(.horizontal, 17)
                if viewModel.isLoading && viewModel.sessions.isEmpty {
                    HStack {
                        Spacer()
                        ProgressView("Carregando Episódios...")
                        Spacer()
                    }
                    .padding()
                    
                } else if !viewModel.sessions.isEmpty {
                    HStack {
                        LazyVGrid(columns: rows, spacing: 8) {
                            ForEach(viewModel.sessions, id: \.self) { session in
                                SessionEpisodeButton(title: session.displayName, isSelected: viewModel.selectedSession == session
                                ) {
                                    viewModel.filterEpisodes(season: session)
                                }
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, -20)
                        .padding(.bottom, 10)
                    }
                }
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.filteredEpisodes) { episode in
                            CardEpisodes(episode: episode)
                        }
                        .padding(.horizontal, -5)
                        .padding(.vertical, 2)
                    }
                }
            }.padding(.bottom, 50)
                .task {
                    viewModel.loadEpisodes()
                }
        }
    }
}

#Preview {
    EpisodeView()
}
