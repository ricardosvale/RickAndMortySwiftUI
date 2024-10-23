//
//  ContentView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(Color(.characterPage))
            Text("Hello, world!")
                .foregroundColor(.label)
                .font(.custom("Jost", size: 36))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
