//
//  DetailsLocal.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 30/05/25.
//

import SwiftUI

struct LocationDetails: View {
    let location: Location
    @StateObject private var viewModel: LocationDetailsViewModel
    
    init(location: Location) {
        self.location = location
        _viewModel = StateObject(wrappedValue: LocationDetailsViewModel(location: location))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.location.name)
                    .foregroundStyle(.colorOrange)
                    .font(.jockeyOne(size: 52))
                    .padding(.leading, 22)
                Spacer()
                Text(viewModel.location.type)
                    .font(.jockeyOne(size: 32))
                    .padding(.trailing, 28 )
                
            }
            Text(viewModel.location.dimension)
                .font(.jost(.medium, size: 24))
                .padding(.leading, 22)
            
            HorizontalCharacterListView(title: "Residentes", characters: viewModel.characters)
        }
        .task {
            await viewModel.fetchCharacters(url: viewModel.location.residents)
        }
    }
}

#Preview {
    LocationDetails(location: Location.locationMock())
}
