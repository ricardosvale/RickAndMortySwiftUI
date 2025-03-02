//
//  LocationView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 01/03/25.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        Text("Locais")
            .font(.jockeyOne(size: 36))
        Text("Explore o universo")
            .font(.jost(.regular, size: 20))
        
        ZStack {
            Image("locationImg")
                .resizable()
                .cornerRadius(10)
                .clipped()
                .frame(width: 360, height: 120)
           
            
            VStack (alignment: .leading) {
                Text("Name")
                    .font(.instrument(.bold, size: 24))
                    .foregroundStyle(.colorLabel)
                Text("Type")
                    .font(.instrument(.medium, size: 16))
                    .foregroundStyle(.colorLabel)
            }
            .padding(.leading, -160)
         }
        .padding()
    }
}

#Preview {
    LocationView()
}
