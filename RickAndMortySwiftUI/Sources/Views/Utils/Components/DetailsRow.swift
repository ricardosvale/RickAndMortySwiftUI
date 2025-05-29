//
//  DetailsRow.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo on 29/05/25.
//

import SwiftUI

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.jost(.medium, size: 20))
                .foregroundStyle(.colorDetail)
            
            Spacer()
            
            Text(value)
                .font(.jost(.medium, size: 24))
                .foregroundStyle(.colorLabel)
        }
        .padding(.horizontal, 35)
    }
    
}
