//
//  CardCharacters.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 25/10/24.
//

import SwiftUI

struct CardCharacters: View {
    var body: some View {
        ZStack (alignment: .center){
            RoundedRectangle(cornerRadius: 10)
                .fill(.cardCharacters)
                .stroke(Color(.colorTerciary), lineWidth: 2)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
        
            VStack(alignment: .center, spacing: 5) {
                Image("caracters")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(14)
                    .frame(width: 133, height: 133)
                
                Text("Rick Sanchez")
                    .font(.jockeyOne(size: 24))
                    .padding(.bottom, -5)
                    .lineLimit(1)
                
                Text("Human")
                    .font(.kodeMono(.regular, size:16))
                    .lineLimit(1)
                
                Text("Alive")
                    .font(.kodeMono(.medium, size: 16))
                    .padding(.horizontal, 14)
                    .foregroundColor(.colorPrimary)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.colorPrimary, lineWidth: 2)
                    )
            }
            .padding(.top, 13)
            .padding(.bottom, 14)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            
        }
        
        .frame(width: 176, height: 240)
    }
}

#Preview {
    CardCharacters()
}
