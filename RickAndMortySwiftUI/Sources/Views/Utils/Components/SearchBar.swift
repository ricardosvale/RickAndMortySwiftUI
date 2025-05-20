//
//  SearchBar.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 14/03/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var search: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        
        HStack {
            TextField("", text: $search, prompt: Text("Busque o personagem")
                .foregroundStyle(.gray)
            )
            .font(.jost(.medium, size: 16))
            .padding(12)
            .foregroundStyle(.black)
            .background(.colorPrimary)
            .cornerRadius(10)
            .focused($isFocused)
            .submitLabel(.search)
        }
        .padding(10)
    }
}

#Preview {
    SearchBar(search: .constant(""))
}
