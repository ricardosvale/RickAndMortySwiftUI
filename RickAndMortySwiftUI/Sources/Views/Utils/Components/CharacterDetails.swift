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
        
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.colorSecondary, .linearBottom]), startPoint: .top, endPoint: .bottom)
                )
                .frame(maxWidth: .infinity, maxHeight: 343)
                .padding(.horizontal)
                .shadow(color: .primary.opacity(0.3), radius: 8, x: 0, y: 5)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(character.name)
                        .font(.jockeyOne(size: 32))
                        .foregroundStyle(.colorLabel)
                        .lineLimit(1)
                        .layoutPriority(1)
                    
                    Spacer()
                    
                    Text(CharacterStatus(from: character.status).formatted)
                        .font(.kodeMono(.medium, size: 16))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(CharacterStatus(from: character.status).color)
                        )
                }
                .padding(.horizontal, 35)
                
                DetailRow(label: "Espécie", value: character.species)
                DetailRow(label: "Gênero", value: character.gender)
                DetailRow(label: "Origem", value: character.origin.name)
                
            }
            .padding()
            .padding(.top, 10)
        }
    }
}

#Preview {
    CharacterDetails(character: Character.characterMock())
}
