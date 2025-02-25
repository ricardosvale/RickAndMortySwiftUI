//
//  CharacterDetails.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 18/12/24.
//

import SwiftUI

struct CharacterDetails: View {
    let character: Character
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.colorSecondary, .linearBottom]), startPoint: .top, endPoint: .bottom)
                )
                .frame(maxWidth: .infinity, maxHeight: 343)
                .padding()
                
            VStack {
                HStack {
                    Text("Rick Sanchez")
                        .font(.jockeyOne(size: 32))
                        .foregroundStyle(.colorLabel)
                    Text("Alive")
                    .font(.kodeMono(.medium, size: 16))
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(CharacterStatus(from: character.status).color)
                    )
                }
                HStack {
                    Text("Espécie")
                        .font(.jost(.medium, size: 20))
                        .foregroundStyle(.colorDetail)
             
                    Text("Human")
                        .font(.jockeyOne(size: 24))
                        .foregroundStyle(.colorLabel)
                }
                HStack {
                    Text("Gênero")
                        .font(.jost(.medium, size: 20))
                        .foregroundStyle(.colorDetail)
                    Text("Male")
                        .font(.jockeyOne(size: 24))
                        .foregroundStyle(.colorLabel)
                }
                HStack {
                    Text("Origem")
                        .font(.jost(.medium, size: 20))
                        .foregroundStyle(.colorDetail)
                    Text("Earth")
                        .font(.jockeyOne(size: 24))
                        .foregroundStyle(.colorLabel)
                }
            }
        }
    }
}   

#Preview {
    CharacterDetails(character: Character.characterMock())
}
