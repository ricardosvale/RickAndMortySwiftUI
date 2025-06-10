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
 // MARK: Ajustar com GeometryReader
                ZStack(alignment: .top) {
                    Background(color: .back)
                        .ignoresSafeArea()
            Image("detailsLocationImg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 360)
                .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
                .ignoresSafeArea(edges: .top)
                .shadow(color: .primary.opacity(0.3), radius: 20, x: 0, y: 4)
            
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 360)
                
                HStack {
                    Text(viewModel.location.name)
                        .foregroundStyle(.colorOrange)
                        .font(.jockeyOne(size: 52))
                        .padding(.leading, 22)
                        .padding(.trailing, 10)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(viewModel.location.type)
                        .font(.jockeyOne(size: 32))
                        .foregroundStyle(.colorLabel)
                        .padding(.trailing, 28 )
                }
                
                Text(viewModel.location.dimension)
                    .font(.jost(.medium, size: 24))
                    .foregroundStyle(.colorLabel)
                    .padding(.leading, 22)
                    .padding(.bottom, 25)
                
                HorizontalCharacterListView(title: "Residentes", characters: viewModel.characters)
                
                Spacer()
            }
        }
        .task {
            await viewModel.fetchCharacters(url: viewModel.location.residents)
        }
    }
}

#Preview {
    LocationDetails(location: Location.locationMock())
}
