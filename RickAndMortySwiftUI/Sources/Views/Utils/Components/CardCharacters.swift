//
//  CardCharacters.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 25/10/24.
//

import SwiftUI

struct CardCharacters: View {
    let character: Character
    
    var statusColor: Color {
        CharacterStatus(from: character.status).color
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 133, height: 133)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 133, height: 133)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                case .failure:
                    Image(systemName: "Noimage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 133, height: 133)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(character.name)
                .font(.jockeyOne(size: 24))
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .foregroundColor(.colorLabel)
                .padding(.vertical, -5)
            Text(character.species)
                .font(.kodeMono(.regular, size: 16))
                .lineLimit(1)
                .foregroundColor(.colorLabel)
            
            Text(CharacterStatus(from: character.status).formatted)
                .font(.kodeMono(.medium, size: 16))
                .foregroundColor(statusColor)
                .padding(.horizontal, 14)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(statusColor, lineWidth: 1)
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.cardCharacters)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.colorTerciary), lineWidth: 1.5)
                )
        )
        .frame(width: 170)
    }
}
#Preview {
    CardCharacters(character: Character.characterMock())
}
