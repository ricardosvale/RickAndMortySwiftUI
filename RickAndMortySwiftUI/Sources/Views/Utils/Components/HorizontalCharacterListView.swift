//
//  ListCharacterHView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 31/05/25.
//

import SwiftUI

struct HorizontalCharacterListView: View {
    let title: String
    let characters: [Character]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title)
                .font(.jockeyOne(size: 32))
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(characters) { character in
                        ImageView(character: character)
//                            .frame(width: 80, height: 80)
                     }
                }
           }
            .frame(height: 80)
        }
        .padding(.horizontal, 22)
    }
}

#Preview {
    HorizontalCharacterListView(title: "Residente", characters: [Character.characterMock()])
}
