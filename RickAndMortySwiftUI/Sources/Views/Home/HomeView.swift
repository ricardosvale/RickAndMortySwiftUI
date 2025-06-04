//
//  HomeView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 12/11/24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        ZStack {
            Background(color: .back)
            VStack(alignment: .center) {
                Text("Wubba lubba dub dub!")
                    .font(.jockeyOne(size: 42))
                    .padding(10)
                    .padding(.top, 30)

                CardNavigationHome(title: "Personagens", description: "Detalhes sobre o personagem")

                CardNavigationHome(title: "Universo", description: "Explore os mundos dentro do universo Rick and Morty")

                CardNavigationHome(title: "Episódios", description: "Todos os episódios da série com detalhes")

                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
