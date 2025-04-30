//
//  LocationView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 01/03/25.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Locais")
                .font(.jockeyOne(size: 36))
            Text("Explore o universo")
                .font(.jost(.regular, size: 20))
        }
        .padding(.leading, -180)
        VStack {
            ForEach(0..<5) { _ in
                CardLocationView()
            }
        }
        .padding()

        Spacer()
    }
}

#Preview {
    LocationView()
}
