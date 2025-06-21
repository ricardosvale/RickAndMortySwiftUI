//
//  HomeView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 12/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    @StateObject private var characterViewModel = CharacterViewModel()
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
                case .universe:
                    LocationView()
                case .episodies:
                    EpisodeView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
