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
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.cardCharacters)
                .stroke(Color(.colorTerciary), lineWidth: 2)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)

            VStack(alignment: .center, spacing: 5) {
                AsyncImage(url: URL(string: character.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 133, height: 133)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(14)
                            .frame(width: 133, height: 133)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(14)
                            .frame(width: 133, height: 133)
                    @unknown default:
                        EmptyView()
                    }
                }

                Text(character.name)
                    .font(.jockeyOne(size: 24))
                    .padding(.bottom, -5)
                    .padding(.horizontal, 20)
                    .lineLimit(1)
                    .foregroundColor(.colorLabel)

                Text(character.species)
                    .font(.kodeMono(.regular, size: 16))
                    .lineLimit(1)
                    .foregroundColor(.colorLabel)
                    .padding(.horizontal, 20)
                Text(character.status)
                    .font(.kodeMono(.medium, size: 16))
                    .padding(.horizontal, 14)
                    .foregroundColor(statusColor)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(statusColor, lineWidth: 2)
                    )
            }
        }
        .frame(width: 176, height: 240)
    }
}

#Preview {
    CardCharacters(character: Character.characterMock())
}
