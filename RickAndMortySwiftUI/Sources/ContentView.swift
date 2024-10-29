//
//  ContentView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewmodel
    = ApiServiceCharacter()
//    @StateObject private var viewmodel
//    = ApiServiceLocation()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(Color(.characterPage))
            Text("Hello, world!")
                .foregroundColor(.colorLabel)
                .font(.jost(.bold, size: 16))
            Text("Hello, world!")
                .foregroundColor(.colorLabel)
                .font(.jockeyOne(size: 32))
                .padding()
            
                .onAppear{
                    viewmodel.getCharacters()
                    DispatchQueue.main.async {
                        ServiceTeste.loadCharacter()
                    }
                    
            }
        }
        
    }
}
#Preview {
    ContentView()
}
