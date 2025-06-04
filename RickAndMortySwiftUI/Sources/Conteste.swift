//
//  Conteste.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 11/11/24.
//

import SwiftUI

   struct Conteste: View {
            @StateObject private var viewModel = CharacterViewModel()

            var body: some View {
                VStack {
                    if viewModel.isLoading {
                        ProgressView("Carregando...")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.characters) { character in
                                    CardCharacters(character: character)
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchCharactersData()
                }
            }
        }

#Preview {
    Conteste()
}
