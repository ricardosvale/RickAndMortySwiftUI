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
                .padding(.horizontal)

            VStack(alignment: .leading) {
                HStack {
                    Text(character.name)
                        .font(.jockeyOne(size: 32))
                        .foregroundStyle(.colorLabel)
                        .padding(.trailing, 70)
                    Text(character.status)
                    .font(.kodeMono(.medium, size: 16))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(CharacterStatus(from: character.status).color)
                    )
                }
           
                HStack {
                    Text("Espécie")
                        .font(.jost(.medium, size: 20))
                        .foregroundStyle(.colorDetail)
                        .padding(.trailing, 150)
                    Text(character.species)
                        .font(.jockeyOne(size: 24))
                        .foregroundStyle(.colorLabel)
                }
                HStack {
                    Text("Gênero")
                        .font(.jost(.medium, size: 20))
                        .foregroundStyle(.colorDetail)
                        .padding(.trailing, 150)
                    Text(character.gender)
                        .font(.jockeyOne(size: 24))
                        .foregroundStyle(.colorLabel)
                }
                HStack {
                    Text("Origem")
                        .font(.jost(.medium, size: 20))
                        .foregroundStyle(.colorDetail)
                        .padding(.trailing, 150)
                  Text(character.origin.name)
                        .font(.jockeyOne(size: 24))
                        .foregroundStyle(.colorLabel)
                }
            }
            .padding(.top, -140)
        }
    }
}

#Preview {
    CharacterDetails(character: Character.characterMock())
}
