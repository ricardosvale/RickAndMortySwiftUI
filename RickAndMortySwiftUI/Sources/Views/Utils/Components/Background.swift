//
//  SwiftUIView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 23/10/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            Image("imgBack")
                .resizable()
                .scaledToFill()

        }.background(.back)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Background()
}
