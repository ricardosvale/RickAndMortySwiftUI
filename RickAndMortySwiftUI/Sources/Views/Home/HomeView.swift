//
//  HomeView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 12/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            Background(color: .back)
            VStack(alignment: .center) {
                Text("Wubba lubba dub dub!")
                    .font(.jockeyOne(size: 42))
                    .padding(10)
                    .padding(.top, 30)
                
                CardNavigationHome(title: "Personagens", description: "Detalhes sobre o personagem")
                    .onTapGesture {
                        router.push(.characters)
                    }
                
                CardNavigationHome(title: "Universo", description: "Explore os mundos dentro do universo Rick and Morty")
                    .onTapGesture {
                        router.push(.universe)
                    }
                
                CardNavigationHome(title: "Episódios", description: "Todos os episódios da série com detalhes")
                    .onTapGesture {
                        router.push(.episodies)
                    }
                
                Spacer()
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .characters:
                    CharactersView()
                        .environmentObject(router)
                case .universe:
                    LocationView()
                        .environmentObject(router)
                case .episodies:
                    EpisodeView()
                        .environmentObject(router)
                case .characterDetailView(character: let character):
                    CharacterDetailsView(character: character)
                        .environmentObject(router)
                case .episodeDetailView(episode: let episode, let characters):
                    EpisodesDetailsView(characters: characters, episode: episode)
                        .environmentObject(router)
                case .locationDetailView(location: let location):
                    LocationDetails(location: location)
                        .environmentObject(router)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
