//
//  ContentView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var characters: [Character] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(characters, id: \.id) { character in
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(.rect(cornerRadius: 10))
                        } placeholder: {
                            ProgressView() // Placeholder enquanto a imagem carrega
                        }

                        Text(character.name)
                            .font(.headline)
                            .padding(.leading, 10)
                        Text(character.gender)
                            .font(.headline)
                            .padding(.leading, 10)
                    }
                    .padding(.vertical, 5)
                }
            }
            .padding()
        }
        .onAppear {
            ServiceTeste.loadCharacter(onComplete: { characterResponse in
                self.characters = characterResponse.results
            }) { error in
                print("Error loading characters: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
