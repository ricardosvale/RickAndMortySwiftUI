//
//  CardLocation.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 01/03/25.
//
import SwiftUI

struct CardLocationView: View {
    var location: Location
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("locationImg")
                .cornerRadius(10)
                .clipped()
                .padding(.horizontal, 20)
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.instrument(.bold, size: 24))
                    .foregroundStyle(.white)
                Text(location.type)
                    .font(.instrument(.medium, size: 16))
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 10)
         }
    }
}

#Preview {
    CardLocationView(location: Location.locationMock())
}
