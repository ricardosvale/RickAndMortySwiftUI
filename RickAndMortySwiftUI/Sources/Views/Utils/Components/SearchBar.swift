//
//  SearchBar.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 14/03/25.
//

import SwiftUI

struct SearchBar: View {
    @State var serch: String = ""

    var body: some View {

        HStack {
            TextField("", text: $serch, prompt: Text("Busque o personagem")
                .foregroundStyle(.gray)
            )
            .padding(12)
            .foregroundStyle(.black)
            .background(.colorPrimary)
            .cornerRadius(10)
        }
        .padding(10)
       }
}

#Preview {
    SearchBar()
}
