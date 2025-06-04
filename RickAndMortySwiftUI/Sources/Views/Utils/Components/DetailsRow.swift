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
                .frame(width: 130, alignment: .leading)
            Spacer()
            
            Text(value)
                .font(.jost(.medium, size: 24))
                .foregroundStyle(.white)
                .multilineTextAlignment(.trailing)
                .lineLimit(1)
                .truncationMode(.tail)
                
        }
        .padding(.horizontal, 35)
    }
    
}
