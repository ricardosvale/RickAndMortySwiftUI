//
//  CharacterDetailsView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 28/05/25.
//

import SwiftUI

struct CharacterDetailsView: View {
    var character: Character
    var body: some View {
        ZStack {
            Background(color: .characterPage)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("CHARACTER")
                    .font(.jockeyOne(size: 32))
                    .padding(.horizontal, 35)
                    .padding(.bottom, 5)
                
                ImageView(character: character)
                    .padding(.horizontal, 45)
                
                CharacterDetails(character: character)
                    .offset(y: -20)
            }
        }
    }
}
   
#Preview {
    CharacterDetailsView(character: Character.characterMock())
}
