//
//  DetailsLocal.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 30/05/25.
//

import SwiftUI

struct DetailsLocal: View {
    let location: Location
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(location.name)
                    .foregroundStyle(.colorOrange)
                    .font(.jockeyOne(size: 52))
                    .padding(.leading, 22)
                Spacer()
                Text(location.type)
                    .font(.jockeyOne(size: 32))
                    .padding(.trailing, 28 )
               
            }
            Text(location.dimension)
                .font(.jost(.medium, size: 24))
                .padding(.leading, 22)
        }
    }
}

#Preview {
    DetailsLocal(location: Location.locationMock())
}
