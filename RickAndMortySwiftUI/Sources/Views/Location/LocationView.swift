//
//  LocationView.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 01/03/25.
//

import SwiftUI

struct LocationView: View {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Locais")
                .font(.jockeyOne(size: 36))
            Text("Explore o universo")
                .font(.jost(.regular, size: 20))
        }
        .padding(.leading, -180)
        ScrollView {
        VStack {
            
                ForEach(viewModel.location) { location in
                    CardLocationView(location: location)
                        .onAppear {
                            guard let index = viewModel.location.firstIndex(of: location) else { return }
                            
                            if index == viewModel.location.count - 4 {
                                viewModel.loadMoreLocation()
                            }
                        }
                }
            }
        }
        .padding()

        Spacer()
    }
}

#Preview {
    LocationView()
}
