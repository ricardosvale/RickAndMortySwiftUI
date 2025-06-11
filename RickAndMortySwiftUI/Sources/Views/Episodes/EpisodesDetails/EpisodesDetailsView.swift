//
//  EpisodesDetailsView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 04/06/25.
//

import SwiftUI

struct EpisodesDetailsView: View {
    let characters: [Character]
    var body: some View {
        
        ZStack(alignment: .top) {
            Background(color: .back)
                .ignoresSafeArea()
            
            Image("episodesDetails")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 390)
              .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
                .ignoresSafeArea(edges: .top)
                .shadow(color: .primary.opacity(0.3), radius: 20, x: 0, y: 4)
           
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 400)
                HStack {
                    Text("Pilot")
                        .foregroundStyle(.colorOrange)
                        .font(.jockeyOne(size: 32))
                        .padding(.leading, 22)
                    
                    Spacer()
                    
                    Text("22min")
                        .font(.jost(.bold, size: 14))
                        .foregroundStyle(.colorLabel)
                        .padding(.trailing, 28 )
                }
                
                HStack {
                    Text("December 02,2013.")
                        .font(.jost(.regular, size: 14))
                        .foregroundStyle(.colorLabel)
                        .padding(.leading, 22)
                        .padding(.bottom, 25)
                    Spacer()
                    Text("S01E01")
                        .font(.jost(.regular, size: 14))
                        .foregroundStyle(.colorLabel)
                        .padding(.trailing, 28)
                        .padding(.bottom, 25)
                }
                
                HorizontalCharacterListView(title: "Aparições", characters: characters)
                Spacer()
            }
        }
    }
}
#Preview {
    EpisodesDetailsView(characters: Character.characterMock1())
}
