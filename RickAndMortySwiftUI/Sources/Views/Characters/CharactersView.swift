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
            
            VStack(alignment: .leading) {
                SearchBar()
                    .padding(.top, 30)
                    .padding(.horizontal)
              
                if viewModel.isLoading {
                    ProgressView("Carregando...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns){
                            ForEach(viewModel.characters) { character in
                                CardCharacters(character: character)
                            }
                        }
                    }
                }
               Spacer()
            }
            .onAppear {
            viewModel.fetchCharactersData()
            }
        }
    }
}

#Preview {
    CharactersView()
}
