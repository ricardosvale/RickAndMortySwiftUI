//
//  CharactersViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 11/11/24.
//
import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                SearchBar()
                    .padding(.top, 20)
                    .padding(.horizontal, -5)
                    .padding(.bottom, -7)
                
                if viewModel.isLoading {
                    ProgressView("Carregando...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(viewModel.characters) { character in
                                CardCharacters(character: character)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(12)
            .onAppear {
                viewModel.fetchCharactersData()
            }
        }
    }
}

#Preview {
    CharactersView()
}
