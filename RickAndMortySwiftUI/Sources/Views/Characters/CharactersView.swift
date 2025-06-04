//
//  CharactersViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 11/11/24.
//
import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharacterViewModel()
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Background(color: .back)
                    .ignoresSafeArea()
                NavigationStack {
                    if viewModel.isLoading {
                        ProgressView("Carregando...")
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    } else {
                        ScrollView {
                            VStack(spacing: 12) {
                                SearchBar(search: $searchText)
                                    .focused($isSearchFocused)
                                    .padding(.top, 20)
                                    .padding(.horizontal)
                                
                                LazyVGrid(columns: columns, spacing: 12) {
                                    ForEach(viewModel.characters) { character in
                                        NavigationLink(destination: CharacterDetailsView(character: character)) {
                                            CardCharacters(character: character)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .foregroundStyle(.primary)
                                        .onAppear {
                                            guard let index = viewModel.characters.firstIndex(of: character) else { return }
                                            if index == viewModel.characters.count - 4 {
                                                viewModel.loadMoreCharacters()
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .padding(.bottom, 100) // espaço extra pro teclado
                            .frame(minHeight: geometry.size.height)
                        }
                        .padding(.bottom, 40)
                        .onTapGesture {
                            isSearchFocused = false
                        }
                        .ignoresSafeArea(.keyboard)
                    }
                }
            }
        }
    }
}
