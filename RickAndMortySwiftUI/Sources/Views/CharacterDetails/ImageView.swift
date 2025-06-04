//
//  ImageView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 28/05/25.
//

import SwiftUI

struct ImageView: View {
    var character: Character
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView("Carregando imagem...")
                        .padding()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                case .failure:
                    Image("Noimage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                @unknown default:
                    EmptyView()
                }
            }.accessibilityLabel(Text("Imagem de \(character.name)"))
        }
    }
}

#Preview {
    ImageView(character: Character.characterMock())
}
