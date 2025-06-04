//
//  SwiftUIView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 23/10/24.
//

import SwiftUI

struct Background: View {
    let color: Color
    var body: some View {
        ZStack {
            Image("imgBack")
                .resizable()
                .scaledToFill()
        }.background(color)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Background(color: .back)
}
